<%@ page import="uk.gov.ofwat.companysharing.company.Company; uk.gov.ofwat.employee.User" %>
<g:set var="dataBundle" value="${dataBundle}"/>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name * </label>
    <div class="col-md-9 col-sm-9 col-xs-12 ${hasErrors(bean:dataBundle,field:'name','errors')}'">
        <g:textField name="name" required="" value="${dataBundle.name}" class="form-control" placeholder="Data Bundle Name" disabled="${!edit}"></g:textField>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Title * </label>
    <div class="col-md-9 col-sm-9 col-xs-12 ${hasErrors(bean:dataBundle,field:'title','errors')}'">
        <g:textField name="title" required="" value="${dataBundle.title}" class="form-control" placeholder="Data Bundle Displayed Title" disabled="${!edit}"></g:textField>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Ofwat Description * </label>
    <div class="col-md-9 col-sm-9 col-xs-12 ${hasErrors(bean:dataBundle,field:'description','errors')}'">

        %{--<g:textArea name="description" value="${dataBundle.description}" class="form-control" placeholder="Description" disabled="${!edit}"></g:textArea>--}%
        <editor:renderEditor edit="${edit}" id="description" name="description" placeholder="Description" value="${dataBundle.description}"></editor:renderEditor>
%{--
        <div id="hiddenToolbar" style="visibility: hidden"></div>
        <g:hiddenField name="description" id="description" value="${dataBundle.description}" class="" placeholder="Description" disabled="${!edit}"></g:hiddenField>
        <trix-editor input="description" disabled="disabled"></trix-editor>
--}%

    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Company Description * </label>
    <div class="col-md-9 col-sm-9 col-xs-12 ${hasErrors(bean:dataBundle,field:'companyDescription','errors')}'">

        %{--<g:textArea name="description" value="${dataBundle.description}" class="form-control" placeholder="Description" disabled="${!edit}"></g:textArea>--}%
        <editor:renderEditor edit="${edit}" id="companyDescription" name="companyDescription" placeholder="Company Description" value="${dataBundle.companyDescription}"></editor:renderEditor>
        %{--
                <div id="hiddenToolbar" style="visibility: hidden"></div>
                <g:hiddenField name="description" id="description" value="${dataBundle.description}" class="" placeholder="Description" disabled="${!edit}"></g:hiddenField>
                <trix-editor input="description" disabled="disabled"></trix-editor>
        --}%

    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Publish Start Date </label>
    <div class="col-md-9 col-sm-9 col-xs-12 ${hasErrors(bean:dataBundle,field:'publishStartDate','errors')}'">
        <g:textField name="publishStartDate" value="${companySharingTagLib.formatDate(date:dataBundle.publishStartDate, format:'dd/MM/yy HH:mm')}" class="form-control" disabled="${!edit}"></g:textField>
        <span class="fa fa-calendar-o form-control-feedback right" aria-hidden="true"></span>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12 ${hasErrors(bean:dataBundle,field:'publishEndDate','errors')}'">Publish End Date </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <g:textField name="publishEndDate" value="${companySharingTagLib.formatDate(date:dataBundle.publishEndDate, format:'dd/MM/yy HH:mm')}" class="form-control" disabled="${!edit}"></g:textField>
        <span class="fa fa-calendar-o form-control-feedback right" aria-hidden="true"></span>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12 ${hasErrors(bean:dataBundle,field:'completionDate','errors')}'">Completion Date </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <g:textField name="completionDate" value="${companySharingTagLib.formatDate(date:dataBundle.completionDate, format:'dd/MM/yy HH:mm')}" class="form-control" disabled="${!edit}"></g:textField>
        <span class="fa fa-calendar-o form-control-feedback right" aria-hidden="true"></span>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Ofwat Owner </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <g:select value="${dataBundle.owner?.id}" class="form-control" name="owner" disabled="${!edit}" optionKey="id" optionValue="username" from="${uk.gov.ofwat.employee.User.list()}"></g:select>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Default Companies </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <dataBundleTagLib:companyBundleSelect dataBundle="${dataBundle}" id="companies" edit="${edit}"/>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Published? </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <g:checkBox name="published" value="${dataBundle.published}" disabled="${true}"></g:checkBox>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Completed? </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <g:checkBox name="completed" value="${dataBundle.completed}" disabled="${true}"></g:checkBox>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">User Documentation </label>
    <div class="col-md-9 col-sm-9 col-xs-12">
        <!-- <input type="file" name="docs"></input> -->
        <documentationTagLib:renderDocuments documentation="${dataBundle.userDocumentation}"></documentationTagLib:renderDocuments>
    </div>
</div>
<div class="ln_solid"></div>
<asset:script>
    $(document).ready(function(){
        $("#companies").select2();
    });
</asset:script>