using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace platform.ltsyazilim.com.Models
{
    public static class DataProvider
    {
        public static LtsWebEntities db = new LtsWebEntities();
        public static IEnumerable GetCounties()
        {
            var db = new LtsWebEntities();
            return (from county in db.DefLocationCounties
                    join city in db.DefLocationCities on county.CityId equals city.CityId
                    orderby city.Name, county.Name
                    select new { CountyId = county.CountyId, CountyName = "Türkiye > " + city.Name + " > " + county.Name }).ToArray();
        }

        public static string GetCountyByCountyId(int CountyId)
        {
            var db = new LtsWebEntities();
            return (from county in db.DefLocationCounties
                    join city in db.DefLocationCities on county.CityId equals city.CityId
                    where county.CountyId == CountyId
                    select "Türkiye > " + city.Name + " > " + county.Name).SingleOrDefault();
        }

        public static IEnumerable GetFirms()
        {
            //return db.Firms.OrderBy(f => f.CreatedOn).ToArray();
            return from firm in db.Firms orderby firm.CreatedOn select firm;
        }

        public static IEnumerable GetFirmsByUser(int UserId)
        {
            return (from map in db.MapFirmToUser
                    join firm in db.Firms on map.FirmId  equals firm.FirmId
                    where map.UserId == UserId && map.IsActive == true
                    orderby firm.FirmId                   
                    select new { FirmId = firm.FirmId, FirmName = firm.FirmName }).ToList();
        }

        public static IEnumerable GetDefOrderTypes()
        {
            return (from r in db.DefOrderTypes orderby r.OrderTypeId select r).ToList();
        }

        public static IEnumerable GetDefVehicleTypes()
        {
            return (from r in db.DefVehicleTypes where r.IsDeleted == false orderby r.VehicleTypeName descending select r).ToList();
        }

        public static IEnumerable GetDefProductTypes()
        {
            return (from r in db.DefProductTypes where r.IsDeleted == false orderby r.ProductTypeName descending select r).ToList();
        }

        public static IEnumerable GetDefProductPackages()
        {
            return (from r in db.DefProductPackages where r.IsDeleted == false orderby r.ProductPackageName descending select r).ToList();
        }

        //Order Pages Data Controllers

        public static IEnumerable GetDefVehicleTypesForOrder()
        {
            return (from r in db.DefVehicleTypes where r.IsDeleted == false orderby r.VehicleTypeName select r).ToList();
        }

        public static IEnumerable TreeListCountyList()
        {
            var model = db.ManageSelectCountyListForTreeView();
            return model.ToList();
        }
    }
}