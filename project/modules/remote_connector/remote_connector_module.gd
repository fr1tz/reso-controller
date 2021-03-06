# Copyright © 2017, 2018 Michael Goldener <mg@wasted.ch>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


extends Node

var gui = null

var mTaskId = -1

func _ready():
	var task_properties = {
		"name": "Remote Connector",
		"icon": get_node("icon").get_texture(),
		"canvas": get_node("canvas"),
	}
	mTaskId = rcos.add_task(task_properties)
	gui = get_node("canvas/connector_gui")

func request_focus():
	if mTaskId >= 0:
		var task_properties = {
			"wants_focus": true
		}
		rcos.change_task(mTaskId, task_properties)
