using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SailingSales.Startup))]
namespace SailingSales
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
