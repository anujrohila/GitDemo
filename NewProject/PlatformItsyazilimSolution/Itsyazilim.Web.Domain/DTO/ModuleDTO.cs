//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2015/02/03 - 22:39:20
//
//     Changes to this file may cause incorrect behavior and will be lost if the code is regenerated.
// </auto-generated>
//-------------------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace Itsyazilim.Web.Domain
{
    [DataContract()]
    public partial class ModuleDTO
    {
        [DataMember()]
        public Int32 ModuleId { get; set; }

        [DataMember()]
        public String ModuleName { get; set; }

        [DataMember()]
        public String Description { get; set; }

        [DataMember()]
        public List<Int32> ModuleRoleMappings_ModuleRoleMappingId { get; set; }

        public ModuleDTO()
        {
        }

        public ModuleDTO(Int32 moduleId, String moduleName, String description, List<Int32> moduleRoleMappings_ModuleRoleMappingId)
        {
			this.ModuleId = moduleId;
			this.ModuleName = moduleName;
			this.Description = description;
			this.ModuleRoleMappings_ModuleRoleMappingId = moduleRoleMappings_ModuleRoleMappingId;
        }
    }
}
