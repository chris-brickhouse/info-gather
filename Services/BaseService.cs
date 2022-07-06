namespace InfoGather.Services {
    public class BaseService {
        public static HttpContext _hca;
        public static IWebHostEnvironment _env;
        public IGContext db;

        public BaseService(HttpContext? hca = null, IWebHostEnvironment? env = null) {
            
            if (hca != null) {
                _hca = hca;
            }
            if (env != null) {
                _env = env;
            }
            db = new IGContext();
        }

        public async Task<dynamic> SignUp(SignupRequest form) {            
            db.Users.Add(new Users() { Email = form.email, Name= form.name, Other = form.other,Skills = form.skills, Phone = form.phone });
            await db.SaveChangesAsync();
            return new { success = true };
        }

        public static string GetRootPath() {
            return _env.ContentRootPath;
        }

    }
}
