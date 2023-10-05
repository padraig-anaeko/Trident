using Microsoft.Extensions.Configuration;
using System;

namespace Trident.Web.Core.Configuration
{
    public interface IMetricConfiguration
    {
        string ConnectionString { get; set; }
    }

    public class MetricConfiguration : IMetricConfiguration
    {
        public string ConnectionString { get; set; }

        public MetricConfiguration(IConfiguration configuration)
        {
            ConnectionString = Environment.GetEnvironmentVariable("TRIDENT_CONNECTION_STRING");                      
        }
    }
}
