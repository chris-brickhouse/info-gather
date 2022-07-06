namespace InfoGather.Services {
    public class BaseService {
        public HttpContext _hca;
        public BaseService(HttpContext? hca = null) {
            
            if (hca != null) {
                _hca = hca;
            }
            //db = new SOModels(GetRoot(), IsProd());
        }

        public async Task<dynamic> Contact(SignupRequest form) {
            string thisMsg = $"Name: {form.fullName}({form.email}/{form.phone})<br>Regarding: {form.regarding}<br><br>Feedback:<br>{form.feedback}";
            await SOUtils.SendEmail(InfoEmail, InfoEmail, "SO Feedback", thisMsg, form.email, db: db);
            return new { success = true };
        }
    }
}
