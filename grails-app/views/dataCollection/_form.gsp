<%@ page import="uk.gov.ofwat.employee.User" %>
<g:set var="dataCollection" value="${dataCollection}"/>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name * </label>
        <div class="col-md-9 col-sm-9 col-xs-12 ${hasErrors(bean:dataCollection,field:'name','errors')}'">
            <g:textField name="name" required="" value="${dataCollection.name}" class="form-control" placeholder="Data Collection Name" disabled="${!edit}"></g:textField>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12 ${hasErrors(bean:dataCollection,field:'description','errors')}'">Description * </label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <g:textArea required="" name="description" rows="6" value="${dataCollection.description}" class="form-control" placeholder="Description" disabled="${!edit}"></g:textArea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Publish Start Date </label>
        <div class="col-md-9 col-sm-9 col-xs-12 ${hasErrors(bean:dataCollection,field:'publishStartDate','errors')}'">
            <g:textField name="publishStartDate" value="${companySharingTagLib.formatDate(date:dataCollection.publishStartDate, format:'dd/MM/yy HH:mm')}" class="form-control" disabled="${!edit}"></g:textField>
            <span class="fa fa-calendar-o form-control-feedback right" aria-hidden="true"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12 ${hasErrors(bean:dataCollection,field:'publishEndDate','errors')}'">Publish End Date </label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <g:textField name="publishEndDate" value="${companySharingTagLib.formatDate(date:dataCollection.publishEndDate, format:'dd/MM/yy HH:mm')}" class="form-control" disabled="${!edit}"></g:textField>
            <span class="fa fa-calendar-o form-control-feedback right" aria-hidden="true"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12 ${hasErrors(bean:dataCollection,field:'completionDate','errors')}'">Completion Date </label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <g:textField name="completionDate" value="${companySharingTagLib.formatDate(date:dataCollection.completionDate, format:'dd/MM/yy HH:mm')}" class="form-control" disabled="${!edit}"></g:textField>
            <span class="fa fa-calendar-o form-control-feedback right" aria-hidden="true"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Owner </label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <g:select value="${dataCollection.owner?.id}" class="form-control" name="owner" disabled="${!edit}" optionKey="id" optionValue="username" from="${uk.gov.ofwat.employee.User.list()}"></g:select>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Published? </label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <g:checkBox name="published" value="${dataCollection.published}" disabled="${true}"></g:checkBox>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Completed? </label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <g:checkBox name="completed" value="${dataCollection.completed}" disabled="${true}"></g:checkBox>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Created By </label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <g:textField name="createdBy" value="${dataCollection.createdBy?.username}" class="form-control" placeholder="Created By User" disabled="${true}"></g:textField>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Date Created </label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <g:textField name="dateCreated" value="${companySharingTagLib.formatDate(date:dataCollection.dateCreated, format:'dd/MM/yy HH:mm')}" class="form-control" placeholder="Date Created" disabled="${true}"></g:textField>
            <span class="fa fa-calendar-o form-control-feedback right" aria-hidden="true"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">Last Updated </label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <g:textField name="lastUpdated" value="${companySharingTagLib.formatDate(date:dataCollection.lastUpdated, format:'dd/MM/yy HH:mm')}" class="form-control" placeholder="Last Updated" disabled="${true}"></g:textField>
            <span class="fa fa-calendar-o form-control-feedback right" aria-hidden="true"></span>
        </div>
    </div>
    <div class="ln_solid"></div>
    <!--
    <div class="form-group">
        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
            <button type="button" class="btn btn-primary">Cancel</button>
            <button class="btn btn-primary" type="reset">Reset</button>
            <button type="submit" class="btn btn-success">SubmdataCollection</button>
        </div>
    </div>
    -->