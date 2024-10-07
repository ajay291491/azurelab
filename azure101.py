from azure.identity import DefaultAzureCredential
from azure.mgmt.healthinsights import HealthInsightsManagementClient

# Initialize the Health Insights client
credentials = DefaultAzureCredential()
health_insights_client = HealthInsightsManagementClient(credentials)

# Example: Get health alerts for a specific resource
resource_uri = "/subscriptions/{subscription_id}/resourceGroups/{resource_group}/providers/{resource_provider}/{resource_name}"
health_alerts = health_insights_client.alerts.list_by_resource(resource_uri)

for alert in health_alerts:
    print(f"Alert name: {alert.name}, Severity: {alert.severity}")
