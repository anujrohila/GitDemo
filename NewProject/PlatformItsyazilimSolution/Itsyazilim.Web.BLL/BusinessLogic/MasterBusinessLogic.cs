using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Itsyazilim.Web.DLL;
using Itsyazilim.Web.Domain;
namespace Itsyazilim.Web.BLL
{
    public static class MasterBusinessLogic
    {
        #region [Declaration]

        #endregion

        #region [Methods

        /// <summary>
        /// Get all country
        /// </summary>
        /// <returns></returns>
        public static List<DefLocationCountyDTO> GetAllCountry()
        {
            var masterRepository = new MasterRepository();
            return masterRepository.GetAllCountry();
        }
        /// <summary>
        /// Get country
        /// </summary>
        /// <returns></returns>
        public static DefLocationCountyDTO GetCountry(int countryId)
        {
            var masterRepository = new MasterRepository();
            return masterRepository.GetCountry(countryId);
        }

        #endregion
    }
}
