/*****************************************************************************
 * dr_4d.h
 * Copyright (C) 2005-2010 VideoLAN
 * $Id: dr_4d.h,v 1.3 2002/05/10 23:50:36 bozo Exp $
 *
 * Authors: Laurent Aimar <fenrir@via.ecp.fr>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 *****************************************************************************/

/*!
 * \file <dr_4d.h>
 * \author Laurent Aimar <fenrir@via.ecp.fr>
 * \brief Application interface for the "Short event" descriptor
 * decoder and generator.
 *
 * Application interface for the "Short event" descriptor
 * decoder and generator. This descriptor's definition can be found in
 * ETSI EN 300 468 section 6.2.35.
 */

#ifndef _DVBPSI_DR_4D_H_
#define _DVBPSI_DR_4D_H_

#ifdef __cplusplus
extern "C" {
#endif


/*****************************************************************************
 * dvbpsi_short_event_dr_t
 *****************************************************************************/
/*!
 * \struct dvbpsi_short_event_dr_s
 * \brief "short event" descriptor structure.
 *
 * This structure is used to store a decoded "short event" descriptor.
 */
/*!
 * \typedef struct dvbpsi_short_event_dr_s dvbpsi_short_event_dr_t
 * \brief dvbpsi_short_event_dr_t type definition.
 */
typedef struct dvbpsi_short_event_dr_s
{
  uint8_t i_iso_639_code[3];    /*!< ISO 639 language code */
  int     i_event_name_length;  /*!< length of event name */
  uint8_t i_event_name[256];    /*!< "short event" name */
  int     i_text_length;        /*!< text length */
  uint8_t i_text[256];          /*!< "short event" text */

} dvbpsi_short_event_dr_t;


/*****************************************************************************
 * dvbpsi_DecodeShortEventDr
 *****************************************************************************/
/*!
 * \fn dvbpsi_short_event_dr_t * dvbpsi_DecodeShortEventDr(
                                        dvbpsi_descriptor_t * p_descriptor)
 * \brief "short event" descriptor decoder.
 * \param p_descriptor pointer to the descriptor structure
 * \return a pointer to a new "short event" descriptor structure which
 * contains the decoded data.
 */
dvbpsi_short_event_dr_t* dvbpsi_DecodeShortEventDr(dvbpsi_descriptor_t * p_descriptor);


/*****************************************************************************
 * dvbpsi_GenShortEventDr
 *****************************************************************************/
/*!
 * \fn dvbpsi_descriptor_t * dvbpsi_GenShortEventDr(
                        dvbpsi_short_event_dr_t * p_decoded, bool b_duplicate)
 * \brief "short event" descriptor generator.
 * \param p_decoded pointer to a decoded "video stream" descriptor structure
 * \param b_duplicate if true then duplicate the p_decoded structure into
 * the descriptor
 * \return a pointer to a new descriptor structure which contains encoded data.
 */
dvbpsi_descriptor_t * dvbpsi_GenShortEventDr(dvbpsi_short_event_dr_t * p_decoded,
                                             bool b_duplicate);


#ifdef __cplusplus
};
#endif

#else
#error "Multiple inclusions of dr_4d.h"
#endif

