using System.Web.Http;
using IMS.ApiModels;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.ViewModels;
using Newtonsoft.Json;

namespace IMS.ApiControllers
{
    public class TempController : BaseApiController
    {
        [HttpGet]
        public TempRequestResponse GetTempServer(string code)
        {
            var tempInfo = TempRequestBLO.Current.GetByModel(new TempRequest {TempCode = code});
            if (tempInfo != null)
            {
                var result = new TempRequestResponse();
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
            var tempInfo = TempRequestBLO.Current.GetByModel(new TempRequest { TempCode = code });
            if (tempInfo != null)
            {
                TempRequestBLO.Current.Remove(tempInfo);
                return true;
            }
            return false;
        }
    }
}