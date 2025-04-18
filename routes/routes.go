package routes

import (
	"obsidian/handlers"

	"github.com/gin-gonic/gin"
)

func SetupRoutes(router *gin.Engine) {
	// Define the /project/discovery route
	router.GET("/binarywall/discovery", handlers.DiscoveryHandler)

	// Define the /project/scan/list.posture route
	router.GET("/binarywall/scan/list/posture", handlers.ScanListPostureHandler)

	//Auth routes
	router.POST("/binarywall/auth/token", handlers.TokenHandler)
	router.POST("/binarywall/auth/token/refresh", handlers.TokenRefreshHandler)
	router.POST("/binarywall/user/login", handlers.LoginHandler)
	router.POST("/binarywall/user/logout", handlers.LogoutHandler)

	//Compliance routes
	router.POST("/binarywall/scan/start/compliance", handlers.ScanStartComplianceHandler)
	router.POST("/binarywall/scan/stop/compliance", handlers.ScanStopComplianceHandler)
	router.POST("/binarywall/scan/status/compliance", handlers.ScanStatusComplianceHandler)
	router.POST("/binarywall/scan/list/compliance", handlers.ScanListComplianceHandler)
	router.POST("/binarywall/scan/results/compliance", handlers.ScanResultsComplianceHandler)
	router.POST("/binarywall/scan/results/count/compliance", handlers.ScanResultsCountComplianceHandler)
	router.POST("/binarywall/scan/results/count/group/cloud-compliance", handlers.ScanResultsCountGroupCloudComplianceHandler)
	router.POST("/binarywall/scan/results/count/group/compliance", handlers.ScanResultsCountGroupComplianceHandler)

	//Secret Scan routes
	router.POST("/binarywall/scan/start/secret", handlers.ScanStartSecretHandler)
	router.POST("/binarywall/scan/stop/secret", handlers.ScanStopSecretHandler)
	router.POST("/binarywall/scan/status/secret", handlers.ScanStatusSecretHandler)
	router.POST("/binarywall/scan/list/secret", handlers.ScanListSecretHandler)
	router.POST("/binarywall/scan/results/secret", handlers.ScanResultsSecretHandler)
	router.POST("/binarywall/scan/results/secret/rules", handlers.ScanResultsSecretRulesHandler)
	router.POST("/binarywall/scan/results/count/secret", handlers.ScanResultsCountSecretHandler)
	router.GET("/binarywall/scan/results/count/group/secret", handlers.ScanResultsCountGroupSecretHandler)

	// Malware Scan routes
	router.POST("/binarywall/scan/start/malware", handlers.ScanStartMalwareHandler)
	router.POST("/binarywall/scan/stop/malware", handlers.ScanStopMalwareHandler)
	router.POST("/binarywall/scan/status/malware", handlers.ScanStatusMalwareHandler)
	router.POST("/binarywall/scan/list/malware", handlers.ScanListMalwareHandler)
	router.POST("/binarywall/scan/results/malware", handlers.ScanResultsMalwareHandler)
	router.POST("/binarywall/scan/results/malware/rules", handlers.ScanResultsMalwareRulesHandler)
	router.POST("/binarywall/scan/results/count/malware", handlers.ScanResultsCountMalwareHandler)
	router.GET("/binarywall/scan/results/count/group/malware", handlers.ScanResultsCountGroupMalwareHandler)
	router.GET("/binarywall/scan/results/count/group/malware/class", handlers.ScanResultsCountGroupMalwareClassHandler)

	//Vulnerability Scan routes
	router.POST("/binarywall/scan/start/vulnerability", handlers.ScanStartVulnerabilityHandler)
	router.POST("/binarywall/scan/stop/vulnerability", handlers.ScanStopVulnerabilityHandler)
	router.POST("/binarywall/scan/status/vulnerability", handlers.ScanStatusVulnerabilityHandler)
	router.POST("/binarywall/scan/list/vulnerability", handlers.ScanListVulnerabilityHandler)
	router.POST("/binarywall/scan/results/vulnerability", handlers.ScanResultsVulnerabilityHandler)
	router.POST("/binarywall/scan/results/count/vulnerability", handlers.ScanResultsCountVulnerabilityHandler)
	router.POST("/binarywall/scan/sbom", handlers.ScanSbomHandler)
	router.POST("/binarywall/scan/sbom/download", handlers.ScanSbomDownloadHandler)

	//Cloud Scanner
	router.POST("/binarywall/scan/list/cloud-compliance", handlers.ScanListCloudComplianceHandler)
	router.POST("/binarywall/scan/results/cloud-compliance", handlers.ScanResultsCloudComplianceHandler)
	router.POST("/binarywall/scan/results/cloud/cloud-compliance", handlers.ScanResultsCloudCloudComplianceHandler)

	//Reports
	router.GET("/binarywall/reports", handlers.GetReportsHandler)
	router.POST("/binarywall/reports", handlers.PostReportsHandler)
	router.GET("/binarywall/reports/:id", handlers.GetReportHandler)
	router.POST("/binarywall/reports/:id", handlers.PostReportHandler)

}
