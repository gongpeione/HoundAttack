name = "Hound Attack"
version = "0.0.2"
author = "Geeku"
description = "Tips to the hound attack"
forumthread = ""

dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
dst_compatible = true

server_filter_tags = {}

api_version = 6
api_version_dst = 10

client_only_mod = false
all_clients_require_mod = false

configuration_options =
{
	{
		name = "enable_houndattack",
		label = "Enable Hound Attack",
		options =	{
						{description = "True", data = true},
						{description = "False", data = false}
					},

		default = true,
	
	},
	{
		name = "format",
		label = "String format",
		options =	{
						{description = "Complex", data = "complex"},
						{description = "Simple", data = "simple"}
					},

		default = "complex",
	
	}
}