#!/bin/bash

# Base URL of your API
BASE_URL="http://localhost:7500"

# Function to print a separator
print_separator() {
  echo "================================================"
}

# Function to test a GET request
test_get() {
  local endpoint=$1
  echo "Testing GET $endpoint"
  full_url="$BASE_URL$endpoint"
  echo "Full URL: $full_url"
  response=$(curl -s -o /dev/null -w "%{http_code}" -X GET "$full_url")
  body=$(curl -s -X GET "$full_url")
  echo "Status Code: $response"
  echo "Response Body: $body"
  echo -e "\n"
}

# Function to test a POST request
test_post() {
  local endpoint=$1
  local payload=$2
  echo "Testing POST $endpoint"
  full_url="$BASE_URL$endpoint"
  echo "Full URL: $full_url"
  echo "Payload: $payload"
  response=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "Content-Type: application/json" -d "$payload" "$full_url")
  body=$(curl -s -X POST -H "Content-Type: application/json" -d "$payload" "$full_url")
  echo "Status Code: $response"
  echo "Response Body: $body"
  echo -e "\n"
}

# ==================== Auth Endpoints ====================
print_separator
echo "Testing Auth Endpoints"
print_separator

test_post "/binarywall/auth/token" '{"username": "user", "password": "pass"}'
test_post "/binarywall/auth/token/refresh" '{"token": "refresh_token"}'
test_post "/binarywall/user/login" '{"username": "user", "password": "pass"}'
test_post "/binarywall/user/logout" '{"token": "jwt_token"}'

# ==================== Compliance Endpoints ====================
print_separator
echo "Testing Compliance Endpoints"
print_separator

test_post "/binarywall/scan/start/compliance" '{"target": "example.com"}'
test_post "/binarywall/scan/stop/compliance" '{"scan_id": "123"}'
test_post "/binarywall/scan/status/compliance" '{"scan_id": "123"}'
test_post "/binarywall/scan/list/compliance" '{}'
test_post "/binarywall/scan/results/compliance" '{"scan_id": "123"}'
test_post "/binarywall/scan/results/count/compliance" '{"scan_id": "123"}'
test_post "/binarywall/scan/results/count/group/cloud-compliance" '{"scan_id": "123"}'
test_post "/binarywall/scan/results/count/group/compliance" '{"scan_id": "123"}'

# ==================== Secret Scan Endpoints ====================
print_separator
echo "Testing Secret Scan Endpoints"
print_separator

test_post "/binarywall/scan/start/secret" '{"target": "example.com"}'
test_post "/binarywall/scan/stop/secret" '{"scan_id": "456"}'
test_post "/binarywall/scan/status/secret" '{"scan_id": "456"}'
test_post "/binarywall/scan/list/secret" '{}'
test_post "/binarywall/scan/results/secret" '{"scan_id": "456"}'
test_post "/binarywall/scan/results/secret/rules" '{"scan_id": "456"}'
test_post "/binarywall/scan/results/count/secret" '{"scan_id": "456"}'
test_get "/binarywall/scan/results/count/group/secret"

# ==================== Malware Scan Endpoints ====================
print_separator
echo "Testing Malware Scan Endpoints"
print_separator

test_post "/binarywall/scan/start/malware" '{"target": "example.com"}'
test_post "/binarywall/scan/stop/malware" '{"scan_id": "789"}'
test_post "/binarywall/scan/status/malware" '{"scan_id": "789"}'
test_post "/binarywall/scan/list/malware" '{}'
test_post "/binarywall/scan/results/malware" '{"scan_id": "789"}'
test_post "/binarywall/scan/results/malware/rules" '{"scan_id": "789"}'
test_post "/binarywall/scan/results/count/malware" '{"scan_id": "789"}'
test_get "/binarywall/scan/results/count/group/malware"
test_get "/binarywall/scan/results/count/group/malware/class"

# ==================== Vulnerability Scan Endpoints ====================
print_separator
echo "Testing Vulnerability Scan Endpoints"
print_separator

test_post "/binarywall/scan/start/vulnerability" '{"target": "example.com"}'
test_post "/binarywall/scan/stop/vulnerability" '{"scan_id": "101"}'
test_post "/binarywall/scan/status/vulnerability" '{"scan_id": "101"}'
test_post "/binarywall/scan/list/vulnerability" '{}'
test_post "/binarywall/scan/results/vulnerability" '{"scan_id": "101"}'
test_post "/binarywall/scan/results/count/vulnerability" '{"scan_id": "101"}'
test_post "/binarywall/scan/sbom" '{"target": "example.com"}'
test_post "/binarywall/scan/sbom/download" '{"sbom_id": "123"}'

# ==================== Cloud Scanner Endpoints ====================
print_separator
echo "Testing Cloud Scanner Endpoints"
print_separator

test_post "/binarywall/scan/list/cloud-compliance" '{}'
test_post "/binarywall/scan/results/cloud-compliance" '{"scan_id": "123"}'
test_post "/binarywall/scan/results/cloud/cloud-compliance" '{"scan_id": "123"}'

# ==================== Report Endpoints ====================
print_separator
echo "Testing Report Endpoints"
print_separator

test_get "/binarywall/reports"
test_post "/binarywall/reports" '{"title": "Report 1", "data": "Some data"}'
test_get "/binarywall/reports/123"
test_post "/binarywall/reports/123" '{"data": "Updated data"}'
