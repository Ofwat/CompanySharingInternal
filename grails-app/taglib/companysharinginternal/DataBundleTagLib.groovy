package companysharinginternal

import uk.gov.ofwat.companysharing.CompanyBundleService
import uk.gov.ofwat.companysharing.DataBundleService
import uk.gov.ofwat.companysharing.collection.CompanyBundle
import uk.gov.ofwat.companysharing.collection.DataBundle
import uk.gov.ofwat.companysharing.collection.inputs.CompanyDataInput
import uk.gov.ofwat.companysharing.collection.inputs.DataInputType
import uk.gov.ofwat.companysharing.company.Company

class DataBundleTagLib {
    //static defaultEncodeAs = [taglib:'html']
    static encodeAsForTags = [companyBundleSelect: [taglib:'none']]
    static namespace = "dataBundleTagLib"

    DataBundleService dataBundleService
    CompanyBundleService companyBundleService

    def companyBundleSelect = {attrs, body ->
        def outputString = ""
        DataBundle dataBundle = attrs.dataBundle
        Boolean edit = attrs.edit
        if(dataBundle != null){
            def editStr = ""
            if(!edit){
                editStr = "disabled='disabled'"
            }
            def id = attrs.id
            outputString = outputString + "<select ${editStr} placeholder='Select Companies' multiple='multiple' id='${id}' name='${id}' class='form-control'>"
            Company.list().each{ company ->
                def selectedStr = ""
                if(dataBundleService.isBundleForCompany(company, dataBundle)){
                    selectedStr = "selected='selected'"
                }
                outputString = outputString + "<option ${selectedStr} value='${company.id}'>${company.name}</option>"
            }
            outputString = outputString + "</select>"
        }
        out << outputString
    }

    def publishUnpublishBundleButton = {attrs, body ->
        def jsBody = """
            \$(document).ready(function(){
                \$("#${attrs?.id}_publish").click(function(e){
                    e.preventDefault();
                    //Show the publish warning!
                    
                });
                \$("#${attrs?.id}_unpublish").click(function(e){
                    e.preventDefault();
                    //Show the publish warning!
                });                                
            });
        """


        def result = ""
        if(attrs.dataBundle != null){

            def db = attrs.dataBundle
            /*
            if(db.published == true){
            */
                //Show the un publish button
//                result = "<button id='${attrs?.id}_unpublish' class='btn btn-warning ${attrs?.class}'>Un-Publish Bundle ${db.name}</button>"
                result = result + "<button id='${attrs?.id}_publish' class='btn btn-success ${attrs?.class}'>Change Published Status</button>"
            /*
            }else{
                //Show the publish button
                result = "<button id='${attrs?.id}' class='btn btn-success ${attrs?.class}'>Publish Bundles in ${db.name}</button>"
            }
            */
        }
result = result + """
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <h4>Text in a modal</h4>
                    <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                    <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>

            </div>
        </div>
    </div>
"""
        jsBody = asset.script({jsBody})
        out << jsBody + result
    }


    //Tag lib to render a table that will show the collections for a bundle, their type and what we are collecting
    def renderCollectionsTable = { attrs, body ->
        Set<DataInput> dataInputs = attrs.dataInputs
        dataInputs = dataInputs?.sort{it.id}
        def dataBundle = attrs.dataBundle
        if(attrs.dataBundleId){
            dataBundle = DataBundle.get(attrs.dataBundleId)
        }
        def rows = ""
        dataInputs.eachWithIndex{ dataInput, index ->
            def companiesString = ""
            Set<CompanyDataInput> companyDataInputs = dataInput.companyDataInput
            companyDataInputs = companyDataInputs?.sort{it.company.name}
            companyDataInputs.each{ companyDataInput ->
                //GEt the company bundle for this input
                //TODO Should we just replace this with a link to the company databundle on the company data input?
                CompanyBundle cb = companyBundleService.getCompanyBundleForDataInputAndCompany(dataInput, companyDataInput.company)
                def publishedStr = "<span class='label label-default'>Not Published</span>"
                if(cb?.published == true){
                    publishedStr = "<span class='label label-success'>Published</span>"
                }
                companiesString = companiesString + "<div class='row'><div class='col-md-6'>${companyDataInput.company.name}</div><div class='col-md-6'>${publishedStr}</div></div>"
            }
            companiesString = companiesString + ""
            rows = rows + "<tr><td>${dataInput.id}</td>" +
                    "<td><i class='fa fa-cube'></i>&nbsp;${dataInput.name}</td>" +
                    "<td><span class='label label-info'><i class='fa fa-table'></i>&nbsp;${DataInputType.NAMES_COLLECTION.get(dataInput.dataInputType.type)}</span></td>" +
                    "<td>${companiesString}</td>" +
                    "<td><a class='btn btn-default' href='/CompanySharingInternal/dataInput/showTableDataInput?dataInputId=${dataInput.id}&dataBundleId=${dataBundle?.id}'>View Data</a></td>" +
                    "<td><a href='#' class='btn btn-default'>Edit</a></td></tr>"
        }

        def result = """
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Companies</th>
                        <th>View Data</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    ${rows}
                </tbody>
            </table>
"""
        out << result
    }

    def renderCompaniesPublished = { attrs, body ->
        /*
        <ul>
        <g:each in="${dataBundle.companies}" var="company">
        <li><a href="<g:createLink action="show" controller="companyDataBundle" id="${company.id}"></g:createLink>">${company.name}</a></li>
        </g:each>
        </ul>
        */
        Map<CompanyBundle> companyBundles = attrs.companyBundles
        companyBundles.each{ CompanyBundle companyBundle ->

        }
        def result = """
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Published?</th>
                    </tr>
                </thead>
                <tbody>
                    ${rows}
                </tbody>
            </table>
"""
    }

}