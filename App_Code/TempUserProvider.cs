using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Web.Configuration;
using System.Configuration.Provider;

using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Collections.Specialized;
using System.Web;
using System.Web.Hosting;
using System.Diagnostics;
using System.Data;

using MainDataSetTableAdapters;



    public class TempUserProvider:MembershipProvider
    {
        #region 属性处理
        private string _AppName;
        private int _CommandTimeout;
        private MembershipPasswordCompatibilityMode _LegacyPasswordCompatibilityMode;
        private int _MaxInvalidPasswordAttempts;
        private int _MinRequiredNonalphanumericCharacters;
        private int _MinRequiredPasswordLength;
        private int _PasswordAttemptWindow;
        private MembershipPasswordFormat _PasswordFormat;
        private string _PasswordStrengthRegularExpression;
        public override string ApplicationName
        {
            get
            {
                return this._AppName;
            }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    throw new ProviderException("ApplicationName不能为空");
                }
                if (value.Length > 50)
                {
                    throw new ProviderException("ApplicationName太长");
                }
                this._AppName = value;
            }

        }
        public override int MaxInvalidPasswordAttempts
        {
            get
            {
                return this._MaxInvalidPasswordAttempts;
            }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get
            {
                return this._MinRequiredNonalphanumericCharacters;
            }
        }

        public override int MinRequiredPasswordLength
        {
            get
            {
                return this._MinRequiredPasswordLength;
            }
        }

        public override int PasswordAttemptWindow
        {
            get { return this._PasswordAttemptWindow; }
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get { return this._PasswordFormat; }
        }

        public override string PasswordStrengthRegularExpression
        {
            get { return this._PasswordStrengthRegularExpression; }
        }

        public override bool RequiresQuestionAndAnswer
        {
            get { return false; }
        }

        public override bool RequiresUniqueEmail
        {
            get { return false; }
        }
        public override bool EnablePasswordReset
        {
            get { return false; }
        }

        public override bool EnablePasswordRetrieval
        {
            get { return false; }
        }
        public override void Initialize(string name, NameValueCollection config)
        {
            if (config == null)
            {
                throw new ArgumentNullException("config");
            }
            if (string.IsNullOrEmpty(name))
            {
                name = "OracleMembershipProvider";
            }
            if (string.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "用户提供程序");
            }
            base.Initialize(name, config);
            this._MaxInvalidPasswordAttempts = string.IsNullOrEmpty(config["maxInvalidPasswordAttempts"]) ? 5 : int.Parse(config["maxInvalidPasswordAttempts"]);
            this._PasswordAttemptWindow = string.IsNullOrEmpty(config["passwordAttemptWindow"]) ? 10 : int.Parse(config["passwordAttemptWindow"]);
            this._MinRequiredPasswordLength = string.IsNullOrEmpty(config["minRequiredPasswordLength"]) ? 7 : int.Parse(config["minRequiredPasswordLength"]);
            this._MinRequiredNonalphanumericCharacters = string.IsNullOrEmpty(config["minRequiredNonalphanumericCharacters"]) ? 1 : int.Parse(config["minRequiredNonalphanumericCharacters"]);
            this._PasswordStrengthRegularExpression = config["passwordStrengthRegularExpression"];
            if (this._PasswordStrengthRegularExpression != null)
            {
                this._PasswordStrengthRegularExpression = this._PasswordStrengthRegularExpression.Trim();
                if (this._PasswordStrengthRegularExpression.Length == 0)
                {
                    goto Label_Password_Validate_Check;
                }
                try
                {
                    new Regex(this._PasswordStrengthRegularExpression);
                    goto Label_Password_Validate_Check;
                }
                catch (ArgumentException exception)
                {
                    throw new ProviderException(exception.Message, exception);
                }
            }
            this._PasswordStrengthRegularExpression = string.Empty;
        Label_Password_Validate_Check:
            if (this._MinRequiredNonalphanumericCharacters > this._MinRequiredPasswordLength)
            {
                throw new HttpException("密码中非字符数最小值不能大于密码最小长度");
            }
            this._CommandTimeout = string.IsNullOrEmpty(config["commandTimeout"]) ? 30 : int.Parse(config["commandTimeout"]);
            this._AppName = config["applicationName"];
            if (string.IsNullOrEmpty(this._AppName))
            {
                this._AppName = GetDefaultAppName();
            }
            if (this._AppName.Length > 50)
            {
                throw new ProviderException("ApplicationName太长");
            }
            string passwordFormat = config["passwordFormat"];
            if (string.IsNullOrEmpty(passwordFormat))
            {
                passwordFormat = "Hashed";
            }
            if (!passwordFormat.ToLower().Equals("clear"))
            {
                if (passwordFormat.ToLower().Equals("encrypted"))
                {
                    this._PasswordFormat = MembershipPasswordFormat.Encrypted;
                    goto Label_PasswordFormat_Check;
                }
                if (passwordFormat.ToLower().Equals("hashed"))
                {
                    this._PasswordFormat = MembershipPasswordFormat.Hashed;
                    goto Label_PasswordFormat_Check;
                }
            }
            else
            {
                this._PasswordFormat = MembershipPasswordFormat.Clear;
                goto Label_PasswordFormat_Check;
            }
            throw new ProviderException("错误的密码格式设定");
        Label_PasswordFormat_Check:
            if ((this.PasswordFormat == MembershipPasswordFormat.Hashed) && this.EnablePasswordRetrieval)
            {
                throw new ProviderException("密码无法获取");
            }
            string passwordCompatMode = config["passwordCompatMode"];
            if (!string.IsNullOrEmpty(passwordCompatMode))
            {
                this._LegacyPasswordCompatibilityMode = (MembershipPasswordCompatibilityMode)Enum.Parse(typeof(MembershipPasswordCompatibilityMode), passwordCompatMode);
            }
            config.Remove("applicationName");
            config.Remove("maxInvalidPasswordAttempts");
            config.Remove("passwordAttemptWindow");
            config.Remove("commandTimeout");
            config.Remove("passwordFormat");
            config.Remove("name");
            config.Remove("minRequiredPasswordLength");
            config.Remove("minRequiredNonalphanumericCharacters");
            config.Remove("passwordStrengthRegularExpression");
            config.Remove("passwordCompatMode");
            if (config.Count > 0)
            {
                string key = config.GetKey(0);
                if (!string.IsNullOrEmpty(key))
                {
                    throw new ProviderException("不识别的Provider配置属性");
                }
            }
        }
        public static string GetDefaultAppName()
        {
            try
            {
                string applicationVirtualPath = HostingEnvironment.ApplicationVirtualPath;
                if (string.IsNullOrEmpty(applicationVirtualPath))
                {
                    applicationVirtualPath = Process.GetCurrentProcess().MainModule.ModuleName;
                    int index = applicationVirtualPath.IndexOf('.');
                    if (index != -1)
                    {
                        applicationVirtualPath = applicationVirtualPath.Remove(index);
                    }
                }
                if (string.IsNullOrEmpty(applicationVirtualPath))
                {
                    return "/";
                }
                return applicationVirtualPath;
            }
            catch
            {
                return "/";
            }
        }
        #endregion

        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            //throw new NotImplementedException();
            try
            {
                TA_用户表TableAdapter da = new TA_用户表TableAdapter();
                DataTable dt = da.ValidateUser(username, oldPassword);
                if (dt.Rows.Count == 1)
                {
                    int result = da.UpdatePwd(newPassword, username);
                    return result > 0 ? true : false;
                }
                else
                {
                    return false;
                }

            }
            catch
            {
                throw;
            }
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            throw new NotImplementedException();
        }



        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override int GetNumberOfUsersOnline()
        {
            throw new NotImplementedException();
        }

        public override string GetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            throw new NotImplementedException();
        }

        public override string GetUserNameByEmail(string email)
        {
            throw new NotImplementedException();
        }




        public override string ResetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override bool UnlockUser(string userName)
        {
            throw new NotImplementedException();
        }

        public override void UpdateUser(MembershipUser user)
        {
            throw new NotImplementedException();
        }

        public override bool ValidateUser(string username, string password)
        {
            TA_用户表TableAdapter da = new TA_用户表TableAdapter();
            DataTable dt = da.ValidateUser(username, password);
            if (dt.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
    }
