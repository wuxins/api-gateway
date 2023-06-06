package dto

import (
	"encoding/json"
)

var globalGrayRule = GrayRule{}
var serviceGrayRule = map[string]GrayRule{}

type GrayRule struct {
	RuleCode       string
	Global         string
	Mode           int
	ScaleRate      int
	FeatureContent string
	FeatureTagMap  map[string]interface{}
	HeaderPassTag  string
}

func FlushGrayRule(rules []GrayRule) {
	for _, rule := range rules {
		if len(rule.FeatureContent) > 0 {
			_ = json.Unmarshal([]byte(rule.FeatureContent), &rule.FeatureTagMap)
		}

		if "Y" == rule.Global {
			globalGrayRule = rule
			continue
		}
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
	return &globalGrayRule
}
