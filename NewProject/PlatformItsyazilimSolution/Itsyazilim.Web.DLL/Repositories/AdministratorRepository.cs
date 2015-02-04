using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Itsyazilim.Web.Database.ORM;
using Itsyazilim.Web.Domain;

namespace Itsyazilim.Web.DLL
{
    public class AdministratorRepository
    {
        #region [Declaration]

        #endregion

        #region [Constructor]

        public AdministratorRepository()
        {

        }

        #endregion

        #region [Methods]

        #region [Firm]

        /// <summary>
        /// Get All Firms
        /// </summary>
        /// <returns></returns>
        public List<FirmDTO> GetAllFirms()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (LtsyazilimDatabaseEntities.Firms.ToDTOs());
            }
        }

        /// <summary>
        /// Get Firm
        /// </summary>
        /// <returns></returns>
        public FirmDTO GetFirm(int firmId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.Firms.Where(firm => firm.FirmId == firmId).FirstOrDefault().ToDTO();
            }
        }

        /// <summary>
        /// Get All Status Based Firm List
        /// </summary>
        /// <param name="isApproved"></param>
        /// <returns></returns>
        public List<FirmDTO> GetAllStatusBasedFirmList(bool isApproved)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (LtsyazilimDatabaseEntities.Firms.Where(firm => firm.IsApproved == isApproved).ToDTOs());
            }
        }


        /// <summary>
        /// Save Firm
        /// </summary>
        /// <returns></returns>
        public int SaveFirm(FirmDTO firmDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var firmDetails = new Firm();
                if (firmDTO.FirmId == 0)
                {
                    firmDetails = firmDTO.ToEntity();
                    LtsyazilimDatabaseEntities.Firms.Add(firmDetails);
                }
                else
                {
                    firmDetails = LtsyazilimDatabaseEntities.Firms.Where(firm => firm.FirmId == firmDTO.FirmId).FirstOrDefault();
                    firmDetails.FirmId = firmDTO.FirmId;
                    firmDetails.FirmName = firmDTO.FirmName;
                    firmDetails.CountyId = firmDTO.CountyId;
                    firmDetails.Address = firmDTO.Address;
                    firmDetails.Phone1 = firmDTO.Phone1;
                    firmDetails.Phone2 = firmDTO.Phone2;
                    firmDetails.Fax = firmDTO.Fax;
                    firmDetails.MobilePhone = firmDTO.MobilePhone;
                    firmDetails.Email = firmDTO.Email;
                    firmDetails.WebSite = firmDTO.WebSite;
                    firmDetails.TaxOffice = firmDTO.TaxOffice;
                    firmDetails.TaxNo = firmDTO.TaxNo;
                    firmDetails.CreatedBy = firmDTO.CreatedBy;
                    firmDetails.IsApproved = firmDTO.IsApproved;
                    firmDetails.ApprovedBy = firmDTO.ApprovedBy;
                    firmDetails.ApprovedOn = firmDTO.ApprovedOn;
                    firmDetails.CreatedOn = firmDTO.CreatedOn;
                    firmDetails.UpdatedOn = firmDTO.UpdatedOn;
                }
                LtsyazilimDatabaseEntities.SaveChanges();
                return firmDetails.FirmId;
            }
        }

        /// <summary>
        /// Get Firm
        /// </summary>
        /// <returns></returns>
        public MapFirmToUserDTO GetMapToFirm(int firmId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.MapFirmToUsers.Where(mapToFirm => mapToFirm.FirmId == firmId).FirstOrDefault().ToDTO();
            }
        }

        /// <summary>
        /// Save Map To Firm
        /// </summary>
        /// <returns></returns>
        public int SaveMapToFirm(MapFirmToUserDTO mapFirmToUserDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var mapFirmToUserDetails = new MapFirmToUser();
                if (mapFirmToUserDTO.MapId == 0)
                {
                    mapFirmToUserDetails = mapFirmToUserDTO.ToEntity();
                    LtsyazilimDatabaseEntities.MapFirmToUsers.Add(mapFirmToUserDetails);
                }
                else
                {
                    mapFirmToUserDetails = LtsyazilimDatabaseEntities.MapFirmToUsers.Where(firm => firm.FirmId == mapFirmToUserDTO.FirmId).FirstOrDefault();
                    mapFirmToUserDetails.MapId = mapFirmToUserDTO.MapId;
                    mapFirmToUserDetails.FirmId = mapFirmToUserDTO.FirmId;
                    mapFirmToUserDetails.UserId = mapFirmToUserDTO.UserId;
                    mapFirmToUserDetails.IsAdmin = mapFirmToUserDTO.IsAdmin;
                    mapFirmToUserDetails.IsActive = mapFirmToUserDTO.IsActive;
                    mapFirmToUserDetails.CreatedOn = mapFirmToUserDTO.CreatedOn;
                }
                LtsyazilimDatabaseEntities.SaveChanges();
                return Convert.ToInt32(mapFirmToUserDetails.MapId);
            }
        }


        #endregion

        #region [VehicleType]

        /// <summary>
        /// Get All Vehicle Type
        /// </summary>
        /// <returns></returns>
        public List<DefVehicleTypeDTO> GetAllVehicleType()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (LtsyazilimDatabaseEntities.DefVehicleTypes.ToDTOs());
            }
        }

        /// <summary>
        /// Get Vehicle Type
        /// </summary>
        /// <returns></returns>
        public DefVehicleTypeDTO GetVehicleType(int vehicleTypeId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.DefVehicleTypes.Where(type => type.VehicleTypeId == vehicleTypeId).FirstOrDefault().ToDTO();
            }
        }


        /// <summary>
        /// Save Vehicle Type
        /// </summary>
        /// <returns></returns>
        public int SaveVehicleType(DefVehicleTypeDTO defVehicleTypeDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var vehicleTypeDetails = new DefVehicleType();
                if (defVehicleTypeDTO.VehicleTypeId == 0)
                {
                    vehicleTypeDetails = defVehicleTypeDTO.ToEntity();
                    LtsyazilimDatabaseEntities.DefVehicleTypes.Add(vehicleTypeDetails);
                }
                else
                {
                    vehicleTypeDetails = LtsyazilimDatabaseEntities.DefVehicleTypes.Where(firm => firm.VehicleTypeId == defVehicleTypeDTO.VehicleTypeId).FirstOrDefault();
                    vehicleTypeDetails.VehicleTypeId = defVehicleTypeDTO.VehicleTypeId;
                    vehicleTypeDetails.VehicleTypeName = defVehicleTypeDTO.VehicleTypeName;
                    vehicleTypeDetails.VehicleWidth = defVehicleTypeDTO.VehicleWidth;
                    vehicleTypeDetails.VehicleLength = defVehicleTypeDTO.VehicleLength;
                    vehicleTypeDetails.VehicleHeight = defVehicleTypeDTO.VehicleHeight;
                    vehicleTypeDetails.VehicleVolume = defVehicleTypeDTO.VehicleVolume;
                    vehicleTypeDetails.VehicleDesi = defVehicleTypeDTO.VehicleDesi;
                    vehicleTypeDetails.VehicleWeight = defVehicleTypeDTO.VehicleWeight;
                    vehicleTypeDetails.IsDeleted = defVehicleTypeDTO.IsDeleted;
                    vehicleTypeDetails.DeletedBy = defVehicleTypeDTO.DeletedBy;
                    vehicleTypeDetails.DeletedOn = defVehicleTypeDTO.DeletedOn;
                }

                LtsyazilimDatabaseEntities.SaveChanges();

                return vehicleTypeDetails.VehicleTypeId;
            }
        }

        #endregion

        #region [ProductPackage]

        /// <summary>
        /// Get All Product Package
        /// </summary>
        /// <returns></returns>
        public List<DefProductPackageDTO> GetAllProductPackage()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (LtsyazilimDatabaseEntities.DefProductPackages.ToDTOs());
            }
        }

        /// <summary>
        /// Get Product Package
        /// </summary>
        /// <returns></returns>
        public DefProductPackageDTO GetProductPackage(int productPackageId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.DefProductPackages.Where(type => type.ProductPackageId == productPackageId).FirstOrDefault().ToDTO();
            }
        }

        /// <summary>
        /// Save Product Package
        /// </summary>
        /// <returns></returns>
        public int SaveProductPackage(DefProductPackageDTO defProductPackageDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var ProductPackageDetails = new DefProductPackage();
                if (defProductPackageDTO.ProductPackageId == 0)
                {
                    ProductPackageDetails = defProductPackageDTO.ToEntity();
                    LtsyazilimDatabaseEntities.DefProductPackages.Add(ProductPackageDetails);
                }
                else
                {
                    ProductPackageDetails = LtsyazilimDatabaseEntities.DefProductPackages.Where(firm => firm.ProductPackageId == defProductPackageDTO.ProductPackageId).FirstOrDefault();
                    ProductPackageDetails.ProductPackageId = defProductPackageDTO.ProductPackageId;
                    ProductPackageDetails.ProductPackageName = defProductPackageDTO.ProductPackageName;
                    ProductPackageDetails.CreatedBy = defProductPackageDTO.CreatedBy;
                    ProductPackageDetails.CreatedOn = defProductPackageDTO.CreatedOn;
                    ProductPackageDetails.IsDeleted = defProductPackageDTO.IsDeleted;
                    ProductPackageDetails.DeletedBy = defProductPackageDTO.DeletedBy;
                    ProductPackageDetails.DeletedOn = defProductPackageDTO.DeletedOn;
                }
                LtsyazilimDatabaseEntities.SaveChanges();
                return ProductPackageDetails.ProductPackageId;
            }
        }

        #endregion

        #region [ProductUnit]

        /// <summary>
        /// Get All Product Unit
        /// </summary>
        /// <returns></returns>
        public List<DefProductUnitDTO> GetAllProductUnit()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (LtsyazilimDatabaseEntities.DefProductUnits.ToDTOs());
            }
        }

        /// <summary>
        /// Get Product Unit
        /// </summary>
        /// <returns></returns>
        public DefProductUnitDTO GetProductUnit(int productUnitId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.DefProductUnits.Where(type => type.ProductUnitId == productUnitId).FirstOrDefault().ToDTO();
            }
        }

        /// <summary>
        /// Save Product Unit
        /// </summary>
        /// <returns></returns>
        public int SaveProductUnit(DefProductUnitDTO defProductUnitDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var ProductUnitDetails = new DefProductUnit();
                if (defProductUnitDTO.ProductUnitId == 0)
                {
                    ProductUnitDetails = defProductUnitDTO.ToEntity();
                    LtsyazilimDatabaseEntities.DefProductUnits.Add(ProductUnitDetails);
                }
                else
                {
                    ProductUnitDetails = LtsyazilimDatabaseEntities.DefProductUnits.Where(firm => firm.ProductUnitId == defProductUnitDTO.ProductUnitId).FirstOrDefault();
                    ProductUnitDetails.ProductUnitId = defProductUnitDTO.ProductUnitId;
                    ProductUnitDetails.ProductUnitName = defProductUnitDTO.ProductUnitName;
                    ProductUnitDetails.CreatedBy = defProductUnitDTO.CreatedBy;
                    ProductUnitDetails.CreatedOn = defProductUnitDTO.CreatedOn;
                    ProductUnitDetails.IsDeleted = defProductUnitDTO.IsDeleted;
                    ProductUnitDetails.DeletedBy = defProductUnitDTO.DeletedBy;
                    ProductUnitDetails.DeletedOn = defProductUnitDTO.DeletedOn;
                }
                LtsyazilimDatabaseEntities.SaveChanges();
                return ProductUnitDetails.ProductUnitId;
            }
        }

        #endregion

        #region [ProductProperty]

        /// <summary>
        /// Get All Product Property
        /// </summary>
        /// <returns></returns>
        public List<DefProductPropertyDTO> GetAllProductProperty()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (LtsyazilimDatabaseEntities.DefProductProperties.ToDTOs());
            }
        }

        /// <summary>
        /// Get Product Property
        /// </summary>
        /// <returns></returns>
        public DefProductPropertyDTO GetProductProperty(int productPropertyId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.DefProductProperties.Where(type => type.ProductPropertyId == productPropertyId).FirstOrDefault().ToDTO();
            }
        }

        /// <summary>
        /// Save Product Property
        /// </summary>
        /// <returns></returns>
        public int SaveProductProperty(DefProductPropertyDTO defProductPropertyDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var ProductPropertyDetails = new DefProductProperty();
                if (defProductPropertyDTO.ProductPropertyId == 0)
                {
                    ProductPropertyDetails = defProductPropertyDTO.ToEntity();
                    LtsyazilimDatabaseEntities.DefProductProperties.Add(ProductPropertyDetails);
                }
                else
                {
                    ProductPropertyDetails = LtsyazilimDatabaseEntities.DefProductProperties.Where(firm => firm.ProductPropertyId == defProductPropertyDTO.ProductPropertyId).FirstOrDefault();
                    ProductPropertyDetails.ProductPropertyId = defProductPropertyDTO.ProductPropertyId;
                    ProductPropertyDetails.ProductPropertyName = defProductPropertyDTO.ProductPropertyName;
                    ProductPropertyDetails.CreatedBy = defProductPropertyDTO.CreatedBy;
                    ProductPropertyDetails.CreatedOn = defProductPropertyDTO.CreatedOn;
                    ProductPropertyDetails.IsDeleted = defProductPropertyDTO.IsDeleted;
                    ProductPropertyDetails.DeletedBy = defProductPropertyDTO.DeletedBy;
                    ProductPropertyDetails.DeletedOn = defProductPropertyDTO.DeletedOn;
                }
                LtsyazilimDatabaseEntities.SaveChanges();
                return ProductPropertyDetails.ProductPropertyId;
            }
        }

        #endregion

        #region [ProductType]

        /// <summary>
        /// Get All Product Type
        /// </summary>
        /// <returns></returns>
        public List<DefProductTypeDTO> GetAllProductType()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (LtsyazilimDatabaseEntities.DefProductTypes.ToDTOs());
            }
        }

        /// <summary>
        /// Get Product Type
        /// </summary>
        /// <returns></returns>
        public DefProductTypeDTO GetProductType(int productTypeId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.DefProductTypes.Where(type => type.ProductTypeId == productTypeId).FirstOrDefault().ToDTO();
            }
        }

        /// <summary>
        /// Save Product Type
        /// </summary>
        /// <returns></returns>
        public int SaveProductType(DefProductTypeDTO defProductTypeDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var ProductTypeDetails = new DefProductType();
                if (defProductTypeDTO.ProductTypeId == 0)
                {
                    ProductTypeDetails = defProductTypeDTO.ToEntity();
                    LtsyazilimDatabaseEntities.DefProductTypes.Add(ProductTypeDetails);
                }
                else
                {
                    ProductTypeDetails = LtsyazilimDatabaseEntities.DefProductTypes.Where(firm => firm.ProductTypeId == defProductTypeDTO.ProductTypeId).FirstOrDefault();
                    ProductTypeDetails = defProductTypeDTO.ToEntity();
                    ProductTypeDetails.ProductTypeId = defProductTypeDTO.ProductTypeId;
                    ProductTypeDetails.ProductTypeName = defProductTypeDTO.ProductTypeName;
                    ProductTypeDetails.CreatedBy = defProductTypeDTO.CreatedBy;
                    ProductTypeDetails.CreatedOn = defProductTypeDTO.CreatedOn;
                    ProductTypeDetails.IsDeleted = defProductTypeDTO.IsDeleted;
                    ProductTypeDetails.DeletedBy = defProductTypeDTO.DeletedBy;
                    ProductTypeDetails.DeletedOn = defProductTypeDTO.DeletedOn;
                }
                LtsyazilimDatabaseEntities.SaveChanges();
                return ProductTypeDetails.ProductTypeId;
            }
        }

        #endregion

        #region [Role]

        /// <summary>
        /// Get All Role
        /// </summary>
        /// <returns></returns>
        public List<RoleDTO> GetAllRole()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (LtsyazilimDatabaseEntities.Roles.ToDTOs());
            }
        }

        /// <summary>
        /// Get Product Type
        /// </summary>
        /// <returns></returns>
        public RoleDTO GetRole(int RoleId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return LtsyazilimDatabaseEntities.Roles.Where(type => type.RoleId == RoleId).FirstOrDefault().ToDTO();
            }
        }

        /// <summary>
        /// Save Role
        /// </summary>
        /// <returns></returns>
        public int SaveRole(RoleDTO roleDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var roleDetails = new Role();
                if (roleDTO.RoleId == 0)
                {
                    roleDetails = roleDTO.ToEntity();
                    LtsyazilimDatabaseEntities.Roles.Add(roleDetails);
                }
                else
                {
                    roleDetails = LtsyazilimDatabaseEntities.Roles.Where(firm => firm.RoleId == roleDTO.RoleId).FirstOrDefault();
                    roleDetails.RoleId = roleDTO.RoleId;
                    roleDetails.RoleName = roleDTO.RoleName;
                    roleDetails.Description = roleDTO.Description;
                }
                LtsyazilimDatabaseEntities.SaveChanges();
                return roleDetails.RoleId;
            }
        }

        /// <summary>
        /// Delete role
        /// </summary>
        /// <returns></returns>
        public bool DeleteRole(int roleId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var roleDetails = LtsyazilimDatabaseEntities.Roles.Find(roleId);
                LtsyazilimDatabaseEntities.Roles.Remove(roleDetails);
                LtsyazilimDatabaseEntities.SaveChanges();
                return true;
            }
        }

        #endregion

        #region [Module Role Mapping]

        /// <summary>
        /// Get All Module Role Mapping
        /// </summary>
        /// <returns></returns>
        public List<ModuleRoleMappingDTO> GetAllModuleRoleMapping()
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (from mapping in LtsyazilimDatabaseEntities.ModuleRoleMappings
                        select new ModuleRoleMappingDTO
                        {
                            ModuleRoleMappingId = mapping.ModuleRoleMappingId,
                            ModuleId = mapping.ModuleId,
                            RoleId = mapping.RoleId,
                            ModuleName = mapping.Module.ModuleName,
                            RoleName = mapping.Role.RoleName
                        }).ToList();
            }
        }

        /// <summary>
        /// Get Module Role Mapping
        /// </summary>
        /// <returns></returns>
        public ModuleRoleMappingDTO GetModuleRoleMapping(int mappingId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                return (from mapping in LtsyazilimDatabaseEntities.ModuleRoleMappings
                        where mapping.ModuleRoleMappingId == mappingId
                        select new ModuleRoleMappingDTO
                        {
                            ModuleRoleMappingId = mapping.ModuleRoleMappingId,
                            ModuleId = mapping.ModuleId,
                            RoleId = mapping.RoleId,
                            ModuleName = mapping.Module.ModuleName,
                            RoleName = mapping.Role.RoleName
                        }).FirstOrDefault();
            }
        }

        /// <summary>
        /// Save Module Role Mapping
        /// </summary>
        /// <returns></returns>
        public int SaveModuleRoleMapping(ModuleRoleMappingDTO moduleRoleMappingDTO)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var moduleRoleMappingDetails = new ModuleRoleMapping();
                if (moduleRoleMappingDTO.ModuleRoleMappingId == 0)
                {
                    moduleRoleMappingDetails = moduleRoleMappingDTO.ToEntity();
                    LtsyazilimDatabaseEntities.ModuleRoleMappings.Add(moduleRoleMappingDetails);
                }
                else
                {
                    moduleRoleMappingDetails = LtsyazilimDatabaseEntities.ModuleRoleMappings.Where(mapping => mapping.ModuleRoleMappingId == moduleRoleMappingDTO.ModuleRoleMappingId).FirstOrDefault();
                    moduleRoleMappingDetails.RoleId = moduleRoleMappingDTO.RoleId;
                    moduleRoleMappingDetails.ModuleId = moduleRoleMappingDTO.ModuleId;
                }
                LtsyazilimDatabaseEntities.SaveChanges();
                return moduleRoleMappingDetails.ModuleRoleMappingId;
            }
        }

        /// <summary>
        /// Delete Module Role Mapping
        /// </summary>
        /// <returns></returns>
        public bool DeleteModuleRoleMapping(int mappingId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var moduleRoleMappingDetails = LtsyazilimDatabaseEntities.ModuleRoleMappings.Where(mapping => mapping.ModuleRoleMappingId == mappingId).FirstOrDefault();
                LtsyazilimDatabaseEntities.ModuleRoleMappings.Remove(moduleRoleMappingDetails);
                return LtsyazilimDatabaseEntities.SaveChanges() > 0;
            }
        }

        /// <summary>
        /// Check Is Module Role MappingExists
        /// </summary>
        /// <returns></returns>
        public bool CheckIsModuleRoleMappingExists(int roleId, int moduleId, int moduleRoleMappingId)
        {
            using (var LtsyazilimDatabaseEntities = new LtsyazilimDatabaseEntities())
            {
                var moduleRoleMappingDetails = LtsyazilimDatabaseEntities.ModuleRoleMappings.Where(mapping => mapping.RoleId == roleId 
                                                                                                    && mapping.ModuleId == moduleId 
                                                                                                    && mapping.ModuleRoleMappingId != moduleRoleMappingId);
                return moduleRoleMappingDetails.Count() > 0;
            }
        }

        #endregion

        #endregion
    }
}
