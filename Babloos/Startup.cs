using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Babloos.Startup))]
namespace Babloos
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
