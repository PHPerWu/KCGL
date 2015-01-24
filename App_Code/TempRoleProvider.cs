using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using MainDataSetTableAdapters;
using System.Data;

    public class TempRoleProvider:RoleProvider
    {
        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetRolesForUser(string username)
        {
            username = username.ToLower();
            string tmpRoleNames = "";
            TA_用户角色表TableAdapter adpter = new TA_用户角色表TableAdapter();
            DataTable table= adpter.GetRolesByName(username);
            for (int i = 0; i < table.Rows.Count; i++)
            {
                tmpRoleNames += table.Rows[i]["ROLE"].ToString() + ",";
            }
            if (tmpRoleNames.Length > 0)
            {
                tmpRoleNames = tmpRoleNames.Substring(0, tmpRoleNames.Length - 1);
                return tmpRoleNames.Split(',');
            }

            return tmpRoleNames.Split(',');
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            string[] roles = this.GetRolesForUser(username);
            if (roles[0].Equals(roleName)) return true;
            return false;
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
