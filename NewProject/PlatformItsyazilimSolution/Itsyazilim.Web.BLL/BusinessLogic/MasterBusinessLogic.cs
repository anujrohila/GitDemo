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

        /// <summary>
        /// Get All Module
        /// </summary>
        /// <returns></returns>
        public static List<ModuleDTO> GetAllModule()
        {
            var masterRepository = new MasterRepository();
            return masterRepository.GetAllModule();
        }

        /// <summary>
        /// Get All Roles
        /// </summary>
        /// <returns></returns>
        public static List<RoleDTO> GetAllRoles()
        {
            var masterRepository = new MasterRepository();
            return masterRepository.GetAllRoles();
        }

        /// <summary>
        /// Get All Member
        /// </summary>
        /// <returns></returns>
        public static List<MembershipDTO> GetAllMember()
        {
            var masterRepository = new MasterRepository();
            return masterRepository.GetAllMember();
        }

        #endregion
    }
}
