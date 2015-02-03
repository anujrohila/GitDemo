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
                    firmDetails = firmDTO.ToEntity();
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
                    mapFirmToUserDetails = mapFirmToUserDTO.ToEntity();
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
                    vehicleTypeDetails = defVehicleTypeDTO.ToEntity();
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
                    ProductPackageDetails = defProductPackageDTO.ToEntity();
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
                    ProductUnitDetails = defProductUnitDTO.ToEntity();
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
                    ProductPropertyDetails = defProductPropertyDTO.ToEntity();
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
                }
                LtsyazilimDatabaseEntities.SaveChanges();
                return ProductTypeDetails.ProductTypeId;
            }
        }

        #endregion

        

        #endregion
    }
}
