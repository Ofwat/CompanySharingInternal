<g:set var="dataBundle" value="${dataBundle}"/>
<g:set var="edit" value="${edit}"/>
<tr>
    <td>
        <a href="<g:createLink controller="dataBundle" action="show" id="${dataBundle.id}"/>"><i class="fa fa-cubes"></i>&nbsp;${dataBundle.name}</a>
        <ul>
        <g:each in="${dataBundle.dataInputs}" var="dataInput">
            <li style="list-style-type: none;">
                <i class="fa fa-cube"></i>&nbsp;${dataInput.name}
                %{--For companies:--}%
                %{--<ul>--}%
                    %{--<g:each in="${dataInput.companyDataInput}" var="companyDataInput">--}%
                        %{--<li>${companyDataInput.company.name}</li>--}%
                    %{--</g:each>--}%
                %{--</ul>--}%
            </li>
        </g:each>
        </ul>
    </td>
    <td><companySharingTagLib:formatDate date="${dataBundle.dateCreated}"></companySharingTagLib:formatDate></td>
    <td>${dataBundle.owner.username}</td>
    <td>Collecting ${dataBundle.dataInputs.size()} data inputs.</td>
    <td><companySharingTagLib:formatDate date="${dataBundle.publishStartDate}" format="dd/MM/yy HH:mm"></companySharingTagLib:formatDate></td>
    <td><companySharingTagLib:formatDate date="${dataBundle.publishEndDate}" format="dd/MM/yy HH:mm"></companySharingTagLib:formatDate></td>
    <td><g:checkBox name="published" value="${dataBundle.published}" disabled="${true}"></g:checkBox></td>
    <td>
        <ul>
            <g:each in="${dataBundle.companies.sort{it.name}}" var="company">
                <li><a href="<g:createLink action="show" controller="companyDataBundle" id="${company.id}"></g:createLink>">${company.name}</a></li>
            </g:each>
        </ul>
    </td>
    <td>User Docs Link Here</td>
    <td>Ofwat Docs Link Here</td>
    <td>${dataBundle.createdBy.username}</td>
    <g:if test="${edit}">
        <!-- Show the delete button -->

        <td>
            <g:if test="${dataBundle.published == true}">
                <a href="#" data-bundleid="${dataBundle.id}" data-collectionid="${dataBundle.dataCollection.id}" class="btn btn-default btnPublish"><i class="fa fa-download"></i>&nbsp;Unpublish</a>
            </g:if>
            <g:else>
                <a href="#" data-bundleid="${dataBundle.id}" data-collectionid="${dataBundle.dataCollection.id}" class="btn btn-success btnPublish"><i class="fa fa-upload"></i>&nbsp;Publish</a>
            </g:else>
            <!--
            <div class="btn-group open">
                <button type="button" class="btn btn-warning">Edit</button>
                <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                </button><div class="dropdown-backdrop"></div>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a>
                    </li>
                    <li><a href="#">Another action</a>
                    </li>
                    <li><a href="#">Something else here</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a>
                    </li>
                </ul>
            </div>
            -->
        </td>

    </g:if>
</tr>