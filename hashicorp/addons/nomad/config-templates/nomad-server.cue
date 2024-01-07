import "strings"

metadata: {
	name:        "nomad-server"
	alias:       "Nomad Server"
	description: "Configure the credentials for the Nomad Server"
	scope:       "system"
	sensitive:   false
}

template: {
	parameter: {
		//+usage=The HTTP(S) API address of the Nomad agent
		NOMAD_ADDR: string
		//+usage=The Nomad region to target
		NOMAD_REGION?: string
		//+usage=The Secret ID of an ACL token to make requests with, for ACL-enabled clusters
		NOMAD_TOKEN?: string
		//+usage=HTTP Basic Authentication credentials to be used when communicating with Nomad
		NOMAD_HTTP_AUTH?: string
	}
	output: {
		apiVersion: "v1"
		kind:       "Secret"
		type:       "Opaque"
		metadata: {
			name: context.name
		}
		stringData: {
			NOMAD_ADDR:   parameter.NOMAD_ADDR
			NOMAD_REGION: parameter.NOMAD_REGION
			if parameter.NOMAD_TOKEN != "" {
				NOMAD_TOKEN: parameter.NOMAD_TOKEN
			}
			if parameter.NOMAD_HTTP_AUTH != "" {
				NOMAD_HTTP_AUTH: parameter.NOMAD_HTTP_AUTH
			}
		}
	}
}
