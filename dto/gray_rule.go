package dto

var serviceGrayRule = map[string]GrayRule{}

type GrayRule struct {
	RuleCode       string
	Mode           int
	ScaleRate      int
	FeatureContent string
	HeaderPassTag  string
}

type FeatureContent struct {
	IpList       string
	HeaderTagMap map[string]interface{}
}

func FlushGrayRule(rules []GrayRule) {
	for _, rule := range rules {
		serviceGrayRule[rule.RuleCode] = rule
	}
}

func GetGrayRule(ruleCode string) *GrayRule {

	if len(ruleCode) <= 0 {
		return nil
	}
	if item, ok := serviceGrayRule[ruleCode]; ok {
		return &item
	}
}
