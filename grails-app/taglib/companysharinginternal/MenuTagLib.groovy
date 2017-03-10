package companysharinginternal

class MenuTagLib {
    //static defaultEncodeAs = [taglib:'html']
    static encodeAsForTags = [companySharingMenu: [taglib:'none']]

    static namespace = "menuTagLib"

    def companySharingMenu = { body, attrs ->
out << """
<div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="/CompanySharingInternal" class="site_title"> <span>Company Sharing Admin.</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                ${asset.image(src: 'user.png', alt: '', class: 'img-circle profile_img')}
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>John Doe</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br>

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>Data Collections</h3>
                <ul class="nav side-menu" style="">
                  <li class=""><a href="/CompanySharingInternal"><i class="fa fa-home"></i> Home <span class=""></span>
                    <!--
                    <ul class="nav child_menu" style="">
                      <li class="current-page"><a href="index.html">Dashboard</a></li>
                      <li><a href="index2.html">Dashboard2</a></li>
                      <li><a href="index3.html">Dashboard3</a></li>
                    </ul>
                    -->
                    </a>
                  </li>
                  <li class=""><a><i class="fa fa-table"></i> Data Collections <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="">
                      <li class="current-page"><a href="${createLink(controller: 'dataCollection', action: 'index')}">View Collections</a></li>
                      <li><a href="${createLink(controller: 'dataCollection', action: 'create')}">Create A New Collection</a></li>
                       <li><a href="${createLink(controller: 'dataCollection', action: 'copy')}">Copy An Existing Collection</a></li>
                    </ul>
                  </li>

                  <li class=""><a><i class="fa fa-user"></i> Users <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="">
                      <li class="current-page"><a href="index.html">View Collections</a></li>
                      <li><a href="index2.html">Create A New Collection</a></li>
                    </ul>
                  </li>

                  <li class=""><a><i class="fa fa-building"></i> Companies <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="">
                      <li class="current-page"><a href="index.html">View Collections</a></li>
                      <li><a href="index2.html">Create A New Collection</a></li>
                    </ul>
                  </li>


                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="" data-original-title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="" data-original-title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="" data-original-title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="" href="login.html" data-original-title="Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>
"""
    }

}
