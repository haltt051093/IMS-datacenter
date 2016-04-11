using System;
using System.Collections.Generic;

namespace IMS.Core.Express
{
    public sealed class ActivationExpress
    {
        #region Express
        private static readonly ActivationExpress container;

        static ActivationExpress()
        {
            container = new ActivationExpress();
        }

        public static object Activate(string code, params object[] parameters)
        {
            var type = container.ResolveInner(code);
            var result = Activator.CreateInstance(type, parameters);
            return result;
        }

        public static object Activate<TClass>(string code, params object[] parameters) where TClass : class
        {
            var result = Activate(code, parameters);
            return (TClass) result;
        }

        public static void Register<TClass>(string code) where TClass : class
        {
            var type = typeof (TClass);
            container.RegisterInner(code, type);
        }

        public static Type Resolve(string code)
        {
            var result = container.ResolveInner(code);
            return result;
        }

        public static TClass Resolve<TClass>(string code) where TClass : class
        {
            var result = container.ResolveInner(code);
            return result as TClass;
        }
        #endregion

        #region Definitions
        private readonly Dictionary<string, Type> dictTypes;

        private ActivationExpress()
        {
            dictTypes = new Dictionary<string, Type>();
        }

        public void RegisterInner(string code, Type type)
        {
            dictTypes[code] = type;
        }

        public Type ResolveInner(string code)
        {
            return dictTypes[code];
        }
        #endregion        
    }
}
