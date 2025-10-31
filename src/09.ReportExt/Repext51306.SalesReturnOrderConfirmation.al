reportextension 56631 "SalesReturnOrdConfirmation Ext" extends "Return Order Confirmation"

{
    //RDLCLayout = 'src\10.ReportLayout\SalesReturnOrderConfirmation_NEBJ.rdlc';

    dataset
    {
        add("Sales Header")
        {
            // (3) Posting Date
            column(PostingDate; "Posting Date") { }

            // (4) Bill-to fields
            column(BillToName; "Bill-to Name") { }
            column(BillToName2; "Bill-to Name 2") { }
            column(BillToAddress; "Bill-to Address") { }
            column(BillToAddress2; "Bill-to Address 2") { }
            column(BillToPostCode; "Bill-to Post Code") { }
            column(BillToCity; "Bill-to City") { }
            column(BillToCustomerNo; "Bill-to Customer No.") { }
            column(CurrencyCode; "Currency Code") { }

            // company information
            column(CompanyFaxNo; CompanyInfo."Fax No.") { }

            column(Return_Receipt_No_; "Return Receipt No.") { }

            // Company Information block (5)
            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyCounty; CompanyInfo.County) { }
            column(CompanyCity; CompanyInfo.City) { }
            column(CompanyAddress; CompanyInfo.Address) { }
            column(CompanyAddress2; CompanyInfo."Address 2") { }
            column(CompanyFax; CompanyInfo."Fax No.") { }
        }
        add(RoundLoop)
        {
            column(StorageTemprature; "Sales Line".StorageTemprature) { } //  保管温度
            column(ReturnReasonCode_Line; "Sales Line"."Return Reason Code") { } // (16) 理由コード
            column(ExternalDocumentNo; "Sales Line"."ExternaDocumentNo.") { }// (18) 外部伝票番号
            column(EU_Description; "Sales Line"."EU Description") { } // EU品名
            column(Description_Bikou; "Sales Line"."Description(Bikou)") { } // 備考 
            column(ReturnReasonDesc_Line; ReturnReasonDescTxt) { }// 理由説明文  
        }

        modify(RoundLoop)
        {
            trigger OnAfterAfterGetRecord()
            begin
                FillReturnReasonDescOnly();
            end;
        }
    }
    var
        ReturnReason: Record "Return Reason"; // Correct table (6635)
        ReturnReasonDescTxt: Text[250];

    local procedure FillReturnReasonDescOnly()
    begin
        Clear(ReturnReasonDescTxt);

        if "Sales Line"."Return Reason Code" = '' then
            exit;

        if ReturnReason.Get("Sales Line"."Return Reason Code") then
            ReturnReasonDescTxt := ReturnReason.Description
        else
            ReturnReasonDescTxt := '';
    end;
}
