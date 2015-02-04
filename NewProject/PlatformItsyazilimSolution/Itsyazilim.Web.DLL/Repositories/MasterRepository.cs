using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Itsyazilim.Web.Database.ORM;
using Itsyazilim.Web.Domain;

namespace Itsyazilim.Web.DLL
{
    public class MasterRepository
    {
        #region [Declaration]

        #endregion

        #region [Constructor]

        public MasterRepository()
        {

        }

        #endregion

        #region [Methods]

        /// <summary>
        /// Get all country
        /// </summary>
        /// <returns></returns>
        public List<DefLocationCountyDTO> GetAllCountry()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.DefLocationCounties.ToDTOs();
            }

        }

        /// <summary>
        /// Get country
        /// </summary>
        /// <returns></returns>
        public DefLocationCountyDTO GetCountry(int countryId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.DefLocationCounties.Where(country => country.CountyId == countryId).FirstOrDefault().ToDTO();
            }
        }

        /// <summary>
        /// Get All Module
        /// </summary>
        /// <returns></returns>
        public List<ModuleDTO> GetAllModule()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.Modules.ToDTOs();
            }
        }

        /// <summary>
        /// Get All Roles
        /// </summary>
        /// <returns></returns>
        public List<RoleDTO> GetAllRoles()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.Roles.ToDTOs();
            }
        }

        #endregion
    }
}
