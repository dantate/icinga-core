/*****************************************************************************
 *
 * NEBMODS.H - Include file for event broker modules
 *
 * Copyright (c) 1999-2009 Ethan Galstad (egalstad@nagios.org)
 * Copyright (c) 2009-2014 Icinga Development Team (http://www.icinga.org)
 *
 * License:
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 *****************************************************************************/

#ifndef _NEBMODS_H
#define _NEBMODS_H

#include "config.h"
#include "nebcallbacks.h"
#include "nebmodules.h"

#ifdef __cplusplus
extern "C" { 
#endif


/***** MODULE STRUCTURES *****/

/* NEB module callback list struct */
typedef struct nebcallback_struct{
	void            *callback_func;
	void            *module_handle;
	int             priority;
	struct nebcallback_struct *next;
        }nebcallback;



/***** MODULE FUNCTIONS *****/

int neb_init_modules(void);
int neb_deinit_modules(void);
int neb_load_all_modules(void);
int neb_load_module(nebmodule *);
int neb_free_module_list(void);
int neb_unload_all_modules(int,int);
int neb_unload_module(nebmodule *,int,int);
int neb_add_module(char *,char *,int);


/***** CALLBACK FUNCTIONS *****/
int neb_init_callback_list(void);
int neb_free_callback_list(void);
int neb_make_callbacks(int,void *);

#ifdef __cplusplus
}
#endif

#endif
