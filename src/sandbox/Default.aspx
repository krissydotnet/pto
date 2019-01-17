<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="sandbox.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script src="./Scripts/jquery-3.3.1.min.js"></script>
        <script src="./Scripts/jquery-ui-1.12.1.min.js"></script>
        <script src="./Scripts/DateCompare.js"></script>
    <script src="Scripts/moment.js"></script>
    <script src="Scripts/fullcalendar.min.js"></script>
    <link href="Content/fullcalendar.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section>


    <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>New Comments!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>New PTO Requests</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
   
          <!-- /.col-lg-6 -->


            </div>
            <!-- /.row -->
           <div class="row">
             <div class="col-lg-12">

               
<div class="card mb-4 box-shadow">

        
                <div class="card-header">
                    <i class="fa fa-bell fa-fw"></i>Overall Employee Balances
                </div>                
                <!-- /.card-heading --> 
                <div class="card-body">
       <div class="overview-container overview-header">
                <div class="overview-user-container">
                        <span>NAME</span>
                </div>
                    <div class="overview-balance-container">
                        <span>BALANCE</span>
                    </div>
                    <div class="overview-schedule-container">
                        <span>NEXT SCHEDULED PTO</span>
                    </div>
           </div>
            
                <div class="overview-container">
                    <div class="overview-user-container">
                        <span id="MainContent_Overview_overviewRepeater_lblName_0">Alex</span>
                    </div>
                    <div class="overview-balance-container">
                        <span id="MainContent_Overview_overviewRepeater_lblBalance_0">20</span> hours
                    </div>
                    <div class="overview-schedule-container">
                        <div class="overview-schedule-date">
                        <span id="MainContent_Overview_overviewRepeater_lblNextEventDate_0">[none]</span></div>
                        <div class="overview-schedule-details"><span id="MainContent_Overview_overviewRepeater_lblNextEvent_0"></span></div>
                    </div>

                </div>
            
                <div class="overview-container">
                    <div class="overview-user-container">
                        <span id="MainContent_Overview_overviewRepeater_lblName_1">Chelsey</span>
                    </div>
                    <div class="overview-balance-container">
                        <span id="MainContent_Overview_overviewRepeater_lblBalance_1">-16</span> hours
                    </div>
                    <div class="overview-schedule-container">
                        <div class="overview-schedule-date">
                        <span id="MainContent_Overview_overviewRepeater_lblNextEventDate_1">5/8/2019 - 5/8/2019</span></div>
                        <div class="overview-schedule-details"><span id="MainContent_Overview_overviewRepeater_lblNextEvent_1">0 hours (Sick)</span></div>
                    </div>

                </div>
            
                <div class="overview-container">
                    <div class="overview-user-container">
                        <span id="MainContent_Overview_overviewRepeater_lblName_2">Daniel</span>
                    </div>
                    <div class="overview-balance-container">
                        <span id="MainContent_Overview_overviewRepeater_lblBalance_2">12</span> hours
                    </div>
                    <div class="overview-schedule-container">
                        <div class="overview-schedule-date">
                        <span id="MainContent_Overview_overviewRepeater_lblNextEventDate_2">[none]</span></div>
                        <div class="overview-schedule-details"><span id="MainContent_Overview_overviewRepeater_lblNextEvent_2"></span></div>
                    </div>

                </div>
            
                <div class="overview-container">
                    <div class="overview-user-container">
                        <span id="MainContent_Overview_overviewRepeater_lblName_3">Judi</span>
                    </div>
                    <div class="overview-balance-container">
                        <span id="MainContent_Overview_overviewRepeater_lblBalance_3">48</span> hours
                    </div>
                    <div class="overview-schedule-container">
                        <div class="overview-schedule-date">
                        <span id="MainContent_Overview_overviewRepeater_lblNextEventDate_3">[none]</span></div>
                        <div class="overview-schedule-details"><span id="MainContent_Overview_overviewRepeater_lblNextEvent_3"></span></div>
                    </div>

                </div>
            
                <div class="overview-container">
                    <div class="overview-user-container">
                        <span id="MainContent_Overview_overviewRepeater_lblName_4">Leah</span>
                    </div>
                    <div class="overview-balance-container">
                        <span id="MainContent_Overview_overviewRepeater_lblBalance_4">48</span> hours
                    </div>
                    <div class="overview-schedule-container">
                        <div class="overview-schedule-date">
                        <span id="MainContent_Overview_overviewRepeater_lblNextEventDate_4">10/1/2019 - 10/2/2019</span></div>
                        <div class="overview-schedule-details"><span id="MainContent_Overview_overviewRepeater_lblNextEvent_4">8 hours (Vacation)</span></div>
                    </div>

                </div>
            
                <div class="overview-container">
                    <div class="overview-user-container">
                        <span id="MainContent_Overview_overviewRepeater_lblName_5">Michael</span>
                    </div>
                    <div class="overview-balance-container">
                        <span id="MainContent_Overview_overviewRepeater_lblBalance_5">24</span> hours
                    </div>
                    <div class="overview-schedule-container">
                        <div class="overview-schedule-date">
                        <span id="MainContent_Overview_overviewRepeater_lblNextEventDate_5">[none]</span></div>
                        <div class="overview-schedule-details"><span id="MainContent_Overview_overviewRepeater_lblNextEvent_5"></span></div>
                    </div>

                </div>
            
                <div class="overview-container">
                    <div class="overview-user-container">
                        <span id="MainContent_Overview_overviewRepeater_lblName_6">Tim</span>
                    </div>
                    <div class="overview-balance-container">
                        <span id="MainContent_Overview_overviewRepeater_lblBalance_6">48</span> hours
                    </div>
                    <div class="overview-schedule-container">
                        <div class="overview-schedule-date">
                        <span id="MainContent_Overview_overviewRepeater_lblNextEventDate_6">1/15/2019 - 1/15/2019</span></div>
                        <div class="overview-schedule-details"><span id="MainContent_Overview_overviewRepeater_lblNextEvent_6">4 hours (Vacation)</span></div>
                    </div>

                </div>
            
                </div> <!-- card-body -->

            

    </div> <!-- card -->
      

                     
                     
            </div>
          </div>
        <!-- /.row -->
               
        </div>
    <!-- /.page-wrapper -->

   
</section>
</asp:Content>
