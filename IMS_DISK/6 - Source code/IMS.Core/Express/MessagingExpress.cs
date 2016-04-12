using System;
using System.Collections.Generic;

namespace IMS.Core.Express
{
    public sealed class MessagingExpress
    {
        #region Express
        private static MessagingExpress container;

        static MessagingExpress()
        {
            container = new MessagingExpress();
        }

        public static void Register<TSender, TArgs>(string message, object subcriber, Action<TSender, TArgs> callback)
        {
            var callbackWrapper = (Action<object, object>)((sender, args) =>
            {
                callback((TSender)sender, (TArgs)args);
            });
            container.RegisterInner(typeof(TSender), typeof(TArgs), message, subcriber, callbackWrapper);
        }

        public static void Register<TSender>(string message, object subcriber, Action<TSender> callback)
        {
            var callbackWrapper = (Action<object, object>)((sender, args) =>
            {
                callback((TSender)sender);
            });
            container.RegisterInner(typeof(TSender), (Type)null, message, subcriber, callbackWrapper);
        }

        public static void RegisterGlobal<TArgs>(string message, Action<TArgs> callback)
        {
            var callbackWrapper = (Action<object, object>)((sender, args) =>
            {
                callback((TArgs)args);
            });
            container.RegisterInner(typeof(MessagingExpress), typeof(TArgs), message, container, callbackWrapper);
        }

        public static void RegisterGlobal(string message, Action callback)
        {
            var callbackWrapper = (Action<object, object>)((sender, args) =>
            {
                callback();
            });
            container.RegisterInner(typeof(MessagingExpress), (Type)null, message, container, callbackWrapper);
        }

        public static void UnRegister<TSender, TArgs>(string message, object subcriber)
        {
            container.UnRegisterInner(typeof(TSender), typeof(TArgs), message, subcriber);
        }

        public static void UnRegister<TSender>(string message, object subcriber)
        {
            container.UnRegisterInner(typeof(TSender), (Type)null, message, subcriber);
        }

        public static void UnRegisterGlobal<TArgs>(string message)
        {
            container.UnRegisterInner(typeof(MessagingExpress), typeof(TArgs), message, container);
        }

        public static void UnRegisterGlobal(string message)
        {
            container.UnRegisterInner(typeof(MessagingExpress), (Type)null, message, container);
        }

        public static void Send<TSender, TArgs>(string message, TSender sender, TArgs args)
        {
            container.SendInner(typeof(TSender), typeof(TArgs), message, (object)sender, (object)args);
        }

        public static void Send<TSender>(string message, TSender sender)
        {
            container.SendInner(typeof(TSender), (Type)null, message, (object)sender, (object)null);
        }

        public static void SendGlobal<TArgs>(string message, TArgs args)
        {
            container.SendInner(typeof(MessagingExpress), typeof(TArgs), message, (object)container, (object)args);
        }

        public static void SendGlobal(string message)
        {
            container.SendInner(typeof(MessagingExpress), (Type)null, message, (object)container, (object)null);
        }
        #endregion

        #region Definitions
        private Dictionary<Tuple<Type, Type, string>, List<Tuple<WeakReference, Action<object, object>>>> dictCallback;

        private MessagingExpress()
        {
            dictCallback = new Dictionary<Tuple<Type, Type, string>, List<Tuple<WeakReference, Action<object, object>>>>();
        }

        private void RegisterInner(Type senderType, Type argsType, string messsage, object subcriber, Action<object, object> callback)
        {
            var key = new Tuple<Type, Type, string>(senderType, argsType, messsage);
            var value = new Tuple<WeakReference, Action<object, object>>(new WeakReference(subcriber), callback);
            if (dictCallback.ContainsKey(key))
            {
                dictCallback[key].Add(value);
            }
            else
            {
                var list = new List<Tuple<WeakReference, Action<object, object>>>
                {
                    value
                };
                dictCallback[key] = list;
            }
        }

        private void UnRegisterInner(Type senderType, Type argsType, string messsage, object subcriber)
        {
            var key = new Tuple<Type, Type, string>(senderType, argsType, messsage);
            if (dictCallback.ContainsKey(key))
            {
                dictCallback[key].RemoveAll((match) =>
                {
                    if (match.Item1.IsAlive)
                    {
                        return match.Item1.Target == subcriber;
                    }
                    return true;
                });
            }
            var list = dictCallback[key];
            if (list.Count > 0)
            {
                dictCallback.Remove(key);
            }
        }

        private void SendInner(Type senderType, Type argsType, string messsage, object sender, object args)
        {
            var key = new Tuple<Type, Type, string>(senderType, argsType, messsage);
            if (dictCallback.ContainsKey(key))
            {
                var list = dictCallback[key];
                foreach (var item in list)
                {
                    if (item.Item1.IsAlive)
                    {
                        item.Item2(sender, args);
                    }
                }
            }
        }
        #endregion
    }
}
