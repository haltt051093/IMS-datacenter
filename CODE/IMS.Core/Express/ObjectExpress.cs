using System.Collections.Generic;
using System.Linq;

namespace IMS.Core.Express
{
    public class ObjectExpress
    {
        public static void CopyValues(object source, object target)
        {
            var sourceType = source.GetType();
            var targetType = target.GetType();
            if(targetType != sourceType && !targetType.IsSubclassOf(sourceType))
            {
                return;
            }

            var props = sourceType.GetProperties();
            foreach (var _prop in props)
            {
                _prop.SetValue(target, _prop.GetValue(source, null), null);
            }
        }

        public static void CopyValues<Model>(Model source, Model target) where Model : class
        {
            var props = typeof(Model).GetProperties();
            foreach (var _prop in props)
            {
                _prop.SetValue(target, _prop.GetValue(source, null), null);
            }
        }

        public static void CopyValues<Model>(Model source, Model target, IList<string> listExclusion) where Model : class
        {
            var props = typeof(Model).GetProperties();
            foreach (var _prop in props)
            {
                if (listExclusion.Contains(_prop.Name))
                {
                    continue;
                }
                _prop.SetValue(target, _prop.GetValue(source, null), null);
            }
        }

        public static void MapValues(object source, object target)
        {
            var sourceType = source.GetType();
            var targetType = target.GetType();

            var sProps = sourceType.GetProperties().Where(x => x.CanRead);
            var tProps = targetType.GetProperties().Where(x => x.CanWrite);
            foreach (var sProp in sProps)
            {
                var tProp = tProps.Where(x => x.Name == sProp.Name && x.PropertyType == sProp.PropertyType).FirstOrDefault();
                if (tProp != null)
                {
                    tProp.SetValue(target, sProp.GetValue(source, null), null);
                }
            }
        }

        public static void MapValues(object source, object target, IList<string> listExclusion)
        {
            var sourceType = source.GetType();
            var targetType = target.GetType();

            var sProps = sourceType.GetProperties().Where(x => x.CanRead);
            var tProps = targetType.GetProperties().Where(x => x.CanWrite);
            foreach (var sProp in sProps)
            {
                if (listExclusion.Contains(sProp.Name))
                {
                    continue;
                }
                var tProp = tProps.Where(x => x.Name == sProp.Name && x.PropertyType == sProp.PropertyType).FirstOrDefault();
                if (tProp != null)
                {
                    tProp.SetValue(target, sProp.GetValue(source, null), null);
                }
            }
        }

        public static bool Equals(object item1, object item2)
        {
            if (item1 == null && item2 == null)
            {
                return true;
            }
            if (item1 == null || item2 == null)
            {
                return false;
            }
            if (!item1.Equals(item2))
            {
                return false;
            }
            return true;
        }

        public static bool Equals<T>(T item1, T item2)
        {
            if (item1 == null && item2 == null)
            {
                return true;
            }
            if (item1 == null || item2 == null)
            {
                return false;
            }
            if (!item1.Equals(item2))
            {
                return false;
            }
            return true;
        }
    }
}
