using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Itsyazilim.Web.DLL;
using Itsyazilim.Web.Domain;
namespace Itsyazilim.Web.BLL
{
    public static class AdministratorBusinessLogic
    {
        #region [Declaration]

        #endregion

        #region [Methods


        #region [Firm]

        /// <summary>
        /// Get All Firms
        /// </summary>
        /// <returns></returns>
        public static List<FirmDTO> GetAllFirms()
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetAllFirms();
        }

        /// <summary>
        /// Get Firm
        /// </summary>
        /// <returns></returns>
        public static FirmDTO GetFirm(int firmId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetFirm(firmId);
        }

        /// <summary>
        /// Get All Status Based Firm List
        /// </summary>
        /// <param name="isApproved"></param>
        /// <returns></returns>
        public static List<FirmDTO> GetAllStatusBasedFirmList(bool isApproved)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetAllStatusBasedFirmList(isApproved);
        }

        /// <summary>
        /// Save Firm
        /// </summary>
        /// <returns></returns>
        public static int SaveFirm(FirmDTO firmDTO)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.SaveFirm(firmDTO);
        }

        /// <summary>
        /// Get Firm
        /// </summary>
        /// <returns></returns>
        public static MapFirmToUserDTO GetMapToFirm(int firmId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetMapToFirm(firmId);
        }

        /// <summary>
        /// Save Map To Firm
        /// </summary>
        /// <returns></returns>
        public static int SaveMapToFirm(MapFirmToUserDTO mapFirmToUserDTO)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.SaveMapToFirm(mapFirmToUserDTO);
        }

        #endregion

        #region [VehicleType]

        /// <summary>
        /// Get All Vehicle Type
        /// </summary>
        /// <returns></returns>
        public static List<DefVehicleTypeDTO> GetAllVehicleType()
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetAllVehicleType();
        }

        /// <summary>
        /// Get Vehicle Type
        /// </summary>
        /// <returns></returns>
        public static DefVehicleTypeDTO GetVehicleType(int vehicleTypeId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetVehicleType(vehicleTypeId);
        }


        /// <summary>
        /// Save Vehicle Type
        /// </summary>
        /// <returns></returns>
        public static int SaveVehicleType(DefVehicleTypeDTO defVehicleTypeDTO)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.SaveVehicleType(defVehicleTypeDTO);
        }

        #endregion

        #region [ProductPackage]

        /// <summary>
        /// Get All Product Package
        /// </summary>
        /// <returns></returns>
        public static List<DefProductPackageDTO> GetAllProductPackage()
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetAllProductPackage();
        }

        /// <summary>
        /// Get Product Package
        /// </summary>
        /// <returns></returns>
        public static DefProductPackageDTO GetProductPackage(int productPackageId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetProductPackage(productPackageId);
        }

        /// <summary>
        /// Save Product Package
        /// </summary>
        /// <returns></returns>
        public static int SaveProductPackage(DefProductPackageDTO defProductPackageDTO)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.SaveProductPackage(defProductPackageDTO);
        }

        #endregion

        #region [ProductUnit]

        /// <summary>
        /// Get All Product Unit
        /// </summary>
        /// <returns></returns>
        public static List<DefProductUnitDTO> GetAllProductUnit()
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetAllProductUnit();
        }

        /// <summary>
        /// Get Product Unit
        /// </summary>
        /// <returns></returns>
        public static DefProductUnitDTO GetProductUnit(int productUnitId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetProductUnit(productUnitId);
        }

        /// <summary>
        /// Save Product Unit
        /// </summary>
        /// <returns></returns>
        public static int SaveProductUnit(DefProductUnitDTO defProductUnitDTO)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.SaveProductUnit(defProductUnitDTO);
        }

        #endregion

        #region [ProductProperty]

        /// <summary>
        /// Get All Product Property
        /// </summary>
        /// <returns></returns>
        public static List<DefProductPropertyDTO> GetAllProductProperty()
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetAllProductProperty();
        }

        /// <summary>
        /// Get Product Property
        /// </summary>
        /// <returns></returns>
        public static DefProductPropertyDTO GetProductProperty(int productPropertyId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetProductProperty(productPropertyId);
        }

        /// <summary>
        /// Save Product Property
        /// </summary>
        /// <returns></returns>
        public static int SaveProductProperty(DefProductPropertyDTO defProductPropertyDTO)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.SaveProductProperty(defProductPropertyDTO);
        }

        #endregion

        #region [ProductType]

        /// <summary>
        /// Get All Product Type
        /// </summary>
        /// <returns></returns>
        public static List<DefProductTypeDTO> GetAllProductType()
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetAllProductType();
        }

        /// <summary>
        /// Get Product Type
        /// </summary>
        /// <returns></returns>
        public static DefProductTypeDTO GetProductType(int productTypeId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetProductType(productTypeId);
        }

        /// <summary>
        /// Save Product Type
        /// </summary>
        /// <returns></returns>
        public static int SaveProductType(DefProductTypeDTO defProductTypeDTO)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.SaveProductType(defProductTypeDTO);
        }

        #endregion

        #region [Role]

        /// <summary>
        /// Get All Role
        /// </summary>
        /// <returns></returns>
        public static List<RoleDTO> GetAllRole()
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetAllRole();
        }

        /// <summary>
        /// Get Product Type
        /// </summary>
        /// <returns></returns>
        public static RoleDTO GetRole(int roleId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetRole(roleId);
        }

        /// <summary>
        /// Save Role
        /// </summary>
        /// <returns></returns>
        public static int SaveRole(RoleDTO roleDTO)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.SaveRole(roleDTO);
        }

        /// <summary>
        /// Delete role
        /// </summary>
        /// <returns></returns>
        public static bool DeleteRole(int roleId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.DeleteRole(roleId);
        }

        #endregion

        #region [Module Role Mapping]

        /// <summary>
        /// Get All Module Role Mapping
        /// </summary>
        /// <returns></returns>
        public static List<ModuleRoleMappingDTO> GetAllModuleRoleMapping()
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetAllModuleRoleMapping();
        }

        /// <summary>
        /// Get Module Role Mapping
        /// </summary>
        /// <returns></returns>
        public static ModuleRoleMappingDTO GetModuleRoleMapping(int mappingId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.GetModuleRoleMapping(mappingId);
        }

        /// <summary>
        /// Save Module Role Mapping
        /// </summary>
        /// <returns></returns>
        public static int SaveModuleRoleMapping(ModuleRoleMappingDTO moduleRoleMappingDTO)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.SaveModuleRoleMapping(moduleRoleMappingDTO);
        }

        /// <summary>
        /// Delete Module Role Mapping
        /// </summary>
        /// <returns></returns>
        public static bool DeleteModuleRoleMapping(int mappingId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.DeleteModuleRoleMapping(mappingId);
        }

        /// <summary>
        /// Check Is Module Role MappingExists
        /// </summary>
        /// <returns></returns>
        public static bool CheckIsModuleRoleMappingExists(int roleId, int moduleId, int moduleRoleMappingId)
        {
            var administratorRepository = new AdministratorRepository();
            return administratorRepository.CheckIsModuleRoleMappingExists(roleId, moduleId, moduleRoleMappingId);
        }

        #endregion

        #endregion
    }
}
