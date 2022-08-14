package dto

/** example:
{
	"Address": "http://localhost:5555",
	"ScaleRelease": {
		"Enable": "Y",
		"Percent": 80
	},
	"FeatureRelease": {
		"Enable": "Y",
		"Headers": {
			"G-Gray-Tag": "Y",
			"did": "12222,311111,22222"
		}
	}
}
*/

type GrayStrategy struct {
	Address        string
	ScaleRelease   ScaleRelease
	FeatureRelease FeatureRelease
}

type ScaleRelease struct {
	Enable  bool
	Percent int
}

type FeatureRelease struct {
	Enable  bool
	Headers map[string]interface{}
}
