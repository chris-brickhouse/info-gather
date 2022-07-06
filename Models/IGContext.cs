namespace InfoGather.Models {
  
    using Microsoft.EntityFrameworkCore;
    using Microsoft.Extensions.Configuration;

    public partial class IGContext : DbContext {
        public IGContext() { }

        public IGContext(DbContextOptions<IGContext> options) : base(options) { }

        public virtual DbSet<Users> Users { get; set; }

        public static string GetConnectionString() {
            string applicationExeDirectory = BaseService.GetRootPath();

            var builder = new ConfigurationBuilder()
            .SetBasePath(applicationExeDirectory)
            .AddJsonFile("appsettings.json");
          
            var appSettingsJson = builder.Build();
            return appSettingsJson["ConnectionStrings:IG"];
        }



        public static IConfigurationRoot GetAppSettings() {
            string applicationExeDirectory = BaseService.GetRootPath();

            var builder = new ConfigurationBuilder()
            .SetBasePath(applicationExeDirectory)
            .AddJsonFile("appsettings.json");

            return builder.Build();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) {
            optionsBuilder.UseSqlServer(GetConnectionString());
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder) {
            base.OnModelCreating(modelBuilder);          
        }

    }
}
