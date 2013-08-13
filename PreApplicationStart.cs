using InfoCaster.Umbraco.TextFieldPreviewable;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Hosting;

[assembly: System.Web.PreApplicationStartMethod(typeof(PreApplicationStart), "RegisterModule")]
namespace InfoCaster.Umbraco.TextFieldPreviewable
{
	public class PreApplicationStart
	{
		public static void RegisterModule()
		{
			HostingEnvironment.RegisterVirtualPathProvider(new EmbeddedResourcesVirtualPathProvider());
		}
	}
}
