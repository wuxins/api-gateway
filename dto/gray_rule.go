package dto

var grayRule GrayRule

type GrayRule struct {
	RuleCode          string
	Mode              int
	ScaleRate         int
	FeatureHeaderTags string
	FeatureIpList     string
	HeaderPassTag     string
}

func FlushGrayRule(rule GrayRule) {
	grayRule = rule
}

func GetGrayRule() *GrayRule {
	return &grayRule
}
