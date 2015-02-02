//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2015-01-28 - 12:02:32
//
//     Changes to this file may cause incorrect behavior and will be lost if the code is regenerated.
// </auto-generated>
//-------------------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;
using System.Linq;
using Itsyazilim.Web.Domain;
using Itsyazilim.Web.Database.ORM;

namespace Itsyazilim.Web.Domain
{

    /// <summary>
    /// Assembler for <see cref="LogSystemMailSend"/> and <see cref="LogSystemMailSendDTO"/>.
    /// </summary>
    public static partial class LogSystemMailSendAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="LogSystemMailSendDTO"/> converted from <see cref="LogSystemMailSend"/>.</param>
        static partial void OnDTO(this LogSystemMailSend entity, LogSystemMailSendDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="LogSystemMailSend"/> converted from <see cref="LogSystemMailSendDTO"/>.</param>
        static partial void OnEntity(this LogSystemMailSendDTO dto, LogSystemMailSend entity);

        /// <summary>
        /// Converts this instance of <see cref="LogSystemMailSendDTO"/> to an instance of <see cref="LogSystemMailSend"/>.
        /// </summary>
        /// <param name="dto"><see cref="LogSystemMailSendDTO"/> to convert.</param>
        public static LogSystemMailSend ToEntity(this LogSystemMailSendDTO dto)
        {
            if (dto == null) return null;

            var entity = new LogSystemMailSend();

            entity.LogId = dto.LogId;
            entity.Email = dto.Email;
            entity.ErrorMessage = dto.ErrorMessage;
            entity.PageName = dto.PageName;
            entity.IP = dto.IP;
            entity.CreatedOn = dto.CreatedOn;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="LogSystemMailSend"/> to an instance of <see cref="LogSystemMailSendDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="LogSystemMailSend"/> to convert.</param>
        public static LogSystemMailSendDTO ToDTO(this LogSystemMailSend entity)
        {
            if (entity == null) return null;

            var dto = new LogSystemMailSendDTO();

            dto.LogId = entity.LogId;
            dto.Email = entity.Email;
            dto.ErrorMessage = entity.ErrorMessage;
            dto.PageName = entity.PageName;
            dto.IP = entity.IP;
            dto.CreatedOn = entity.CreatedOn;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="LogSystemMailSendDTO"/> to an instance of <see cref="LogSystemMailSend"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<LogSystemMailSend> ToEntities(this IEnumerable<LogSystemMailSendDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="LogSystemMailSend"/> to an instance of <see cref="LogSystemMailSendDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<LogSystemMailSendDTO> ToDTOs(this IEnumerable<LogSystemMailSend> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
