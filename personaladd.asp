﻿<!-- #include virtual = "/includes/config.asp" -->
<!-- #include virtual = "/includes/session.asp" -->
<%
	If Request.Form() <> "" Then


        fldPerName              = Request.Form("fldPerName")
        fldPerEmail             = Request.Form("fldPerEmail")

            '# Kayıt İşlemi
			SQL.Execute("Insert Into tblPersonal (fldPerName, fldUserID, fldPerEmail, fldPerStatus) Values ('"& fldPerName &"', "& SET_ADMIN_ID &", '"& fldPerEmail &"', 1)")

			If Err <> 0 Then
				Session("Error") = Err.Description
				Response.Redirect(ErrorRedirect)
                Response.End
			End If

			Session("Ok") = "Ekleme İşleminiz Başarıyla Gerçekleşmiştir."
			Response.Redirect(ErrorRedirect)
			Response.End

		a.Close
		Set a = Nothing

	End If   

    SayfaTitle = "Çalışan Ekle" 
%>

<!doctype html>
<html class="no-js " lang="en">
<head>
    <title><%=SayfaTitle%> - <%=ayarlar_title%></title>
    <!-- #include virtual = "/includes/head.asp" -->
    <link href="/assets/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
</head>
<body class="theme-orange">
    <!-- #include virtual = "/includes/loading.asp" -->
    <!-- #include virtual = "/includes/header.asp" -->
    <!-- #include virtual = "/includes/leftmenu.asp" -->

    <section class="content home">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2><%=SayfaTitle%></h2>
                </div>
                <div class="col-lg-5 col-md-6 col-sm-12">
                    <ul class="breadcrumb float-md-right">
                        <li class="breadcrumb-item"><a href="/"><i class="zmdi zmdi-home"></i>Ana Sayfa</a></li>
                        <li class="breadcrumb-item active"><%=SayfaTitle%></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="card">

                        <div class="body">

                            <% If Session("Error") <> "" Then %>
                            <div class="alert alert-danger text-center" role="alert"><i class="material-icons" style="vertical-align: middle;">error</i> <%=Session("Error")%></div>
                            <div class="c10"></div>
                            <% Session("Error") = "" %>
                            <% End If %>

                            <% If Session("Ok") <> "" Then %>
                            <div class="alert alert-success text-center" role="alert"><i class="material-icons" style="vertical-align: middle;">check_circle</i> <%=Session("Ok")%></div>
                            <div class="c10"></div>
                            <% Session("Ok") = "" %>
                            <% End If %>

                            <form action="" method="post" id="FormGonder" name="FormGonder">
                                <div class="row clearfix">
                                    <div class="col-sm-12">
                                        <div class="row">



                                            <div class="col-sm-12 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" placeholder="Adı Soyadı" name="fldPerName" id="fldPerName" required>
                                                    </div>
                                                </div>
                                            </div>   

                                            <div class="col-sm-12 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" placeholder="Email Adresi" name="fldPerEmail" id="fldPerEmail" required>
                                                    </div>
                                                </div>
                                            </div>                                            


                                        </div>


                                        <div class="hrciz"></div>

                                        <div class="form-group">

                                            <button type="submit" form="FormGonder" class="btn  btn-raised btn-success waves-effect"><i class="material-icons">verified_user</i> EKLE</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- #include virtual = "/includes/footer.asp" -->
        </div>
    </section>
    <script src="/assets/bundles/libscripts.bundle.js"></script>
    <script src="/assets/bundles/vendorscripts.bundle.js"></script>
    <script src="/assets/bundles/jvectormap.bundle.js"></script>
    <script src="/assets/bundles/morrisscripts.bundle.js"></script>
    <script src="/assets/bundles/sparkline.bundle.js"></script>
    <script src="/assets/bundles/knob.bundle.js"></script>
    <script src="/assets/bundles/mainscripts.bundle.js"></script>
    <script src="/assets/js/js.js"></script>
    <script type="text/javascript">
     
        var fldStartDate = document.getElementById('fldStartDate');
        var fldFinishDate = document.getElementById('fldFinishDate');

        fldStartDate.addEventListener('change', function() {
            if (fldStartDate.value)
                fldFinishDate.min = fldStartDate.value;
        }, false);
        fldFinishDate.addEventLiseter('change', function() {
            if (fldFinishDate.value)
                fldStartDate.max = fldFinishDate.value;
        }, false);

    </script> 
</body>
</html>
