<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="url.aspx.cs" Inherits="url" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script>
     
     function CallBackObject() {
         this.XmlHttp = this.GetHttpObject();
         alert('d');
     }
     CallBackObject();
     var request = new XMLHttpRequest();

     request.open('GET', 'http://ddwwwsdfsfsdsfdsafsdfdsafsaorg', true);

     request.onreadystatechange = function () {
         if (request.readyState === 4) {
             if (request.status === 404) {
                 alert("Oh no, it does not exist!");
             }
         }
     };
     alert('request.readyState:' + request.readyState + '  request.status:' + request.status);
     request.send();
    
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

