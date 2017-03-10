<g:set var="dataCollection" value="${dataCollection}"/>
<g:set var="edit" value="${edit}"/>
<table class="table table-bordered table-condensed" id="${id}">
<thead>
    <tr class="">
        <th>Name</th>
        <th>Date Created</th>
        <th>owner</th>
        <th>Data Inputs</th>
        <th>Publish Start Date</th>
        <th>Publish End Date</th>
        <th>Published?</th>
        <th>Companies</th></th>
        <th>User Documentation</th>
        <th>Ofwat Documentation</th>
        <th>Created By</th>
        <g:if test="${edit}">
            <th></th>
        </g:if>
    </tr>
</thead>
<tbody>
    <g:each in="${dataCollection.dataBundles}" var="dataBundle">
        <g:render template="/dataBundle/dataBundleRow" model="${[dataBundle:dataBundle, edit:edit]}"></g:render>
    </g:each>
</tbody>
</table>