using System.Web.Http;
using IMS.ApiModels;
using IMS.Data.Business;
using IMS.Data.ViewModels;
using Newtonsoft.Json;

namespace IMS.ApiControllers
{
    public class TempController : ApiController
    {
        [HttpGet]
        public TempRequest GetTempServer(string code)
        {
            var tempInfo = TempRequestBLO.Current.GetByCode(code);
            if (tempInfo != null)
            {
                var result = new TempRequest();
                result.TempCode = tempInfo.TempCode;
                result.Server = JsonConvert.DeserializeObject<ServerExtendedModel>(tempInfo.Data);
                result.Server.TempCode = tempInfo.TempCode;
                return result;
            }
            return null;
        }

        [HttpGet]
        public bool DeleteTempServer(string code)
        {
            var tempInfo = TempRequestBLO.Current.GetByCode(code);
            if (tempInfo != null)
            {
                TempRequestBLO.Current.Remove(tempInfo);
                return true;
            }
            return false;
        }
    }
}