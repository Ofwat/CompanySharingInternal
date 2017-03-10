<div>
    <!--
        Form to show data collection details
        We will either need to make this editable or not - depending on passed param.
    -->

    <!--
dateCreated
    Boolean published = false
    Boolean completed = false
    -->

    <div class="x_panel">
        <div class="x_title">
            <h2>Data Collection ${dataCollection.name} <small>Created by ${dataCollection.createdBy.username}</small></h2>
            <ul class="nav navbar-right panel_toolbox">
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <br>
            <g:render template="form" bean="${dataCollection}"></g:render>
        </div>
    </div>
</div>
