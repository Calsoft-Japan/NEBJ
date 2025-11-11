page 50011 "Purchase Order Import"
{
    ApplicationArea = All;
    PageType = Card;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            field(FileName; FileName)
            {
                Caption = 'Import File Name';
                Lookup = true;

                trigger OnLookup(var Text: Text): Boolean
                var
                    FileMgt: Codeunit "File Management";
                begin
                    FileName := FileMgt.BLOBImportWithFilter(TempBlob, ImpFileLbl, FileName, StrSubstNo(DialogTxt, FilterTxt), FilterTxt);
                    FileExt := FileMgt.GetExtension(FileName);
                    if (FileName = '') or (not TempBlob.HasValue()) or not (FileExt in ['xlsx', 'xls']) then begin
                        FileName := '';
                        Error(BlankFileErr);
                    end;
                    TempBlob.CreateInStream(FileInStream);
                end;
            }
            field(Import; IsImport)
            {
                Caption = 'Import';
                /* trigger OnValidate()
                var
                begin
                    if IsImport then
                        IsImpTest := false;
                end; */
            }
            /* field(IsImpTest; IsImpTest)
            {
                Caption = 'Import (Test)';
                trigger OnValidate()
                var
                begin
                    if IsImpTest then
                        IsImport := false;
                end;
            } */
        }
    }
    actions
    {
        area(processing)
        {
            action(execute)
            {
                Caption = 'Execute';
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ImpPurchLine: Record "Purchase Line";
                    TestPurchLine: Record "Purchase Line" temporary;
                    TempExcelBuf: Record "Excel Buffer" temporary;
                    SheetName: Text;
                    DataCnt: Integer;
                    ErrCnt: Integer;
                    SkipCnt: Integer;
                    RowNo: Integer;
                    IskeyErr: Boolean;
                    IsRecModify: Boolean;
                    IsJudgeFlg: Boolean;
                begin
                    ClearVariable(DataCnt, ErrCnt, IsRecModify, IskeyErr, IsJudgeFlg);

                    TempExcelBuf.LockTable();
                    SheetName := TempExcelBuf.SelectSheetsNameStream(FileInStream);
                    if SheetName <> '' then begin
                        TempExcelBuf.OpenBookStream(FileInStream, SheetName);
                        TempExcelBuf.ReadSheetContinous(SheetName, true);

                        TempExcelBuf.Reset();
                        TempExcelBuf.SetFilter("Row No.", '<>1');
                        if IsImport then begin  //Import Execution
                            ImpPurchLine.Reset();
                            ImpPurchLine.LockTable();
                            if TempExcelBuf.FindFirst() then begin
                                RowNo := TempExcelBuf."Row No.";
                                repeat
                                    if (TempExcelBuf."Row No." <> RowNo) and (TempExcelBuf."Row No." <> 2) then begin
                                        InsertOrModify(ImpPurchLine, IsRecModify, IskeyErr, DataCnt, ErrCnt, IsJudgeFlg);
                                        RowNo := TempExcelBuf."Row No.";
                                    end;
                                    ValidateExcelData(TempExcelBuf, ImpPurchLine, IsRecModify, IskeyErr, IsJudgeFlg);
                                until TempExcelBuf.Next() <= 0;
                            end;
                            InsertOrModify(ImpPurchLine, IsRecModify, IskeyErr, DataCnt, ErrCnt, IsJudgeFlg);
                            Commit;
                        end;
                        /* end else begin  //Import Test Execution
                            TestPurchLine.Reset();
                            TestPurchLine.LockTable();
                            IF TempExcelBuf.FindFirst() then begin
                                RowNo := TempExcelBuf."Row No.";
                                repeat
                                    if (TempExcelBuf."Row No." <> RowNo) and (TempExcelBuf."Row No." <> 2) then begin
                                        InsertOrModify(TestPurchLine, IsRecModify, IskeyErr, DataCnt, ErrCnt, IsJudgeFlg);
                                        RowNo := TempExcelBuf."Row No.";
                                    end;
                                    ValidateExcelData(TempExcelBuf, TestPurchLine, IsRecModify, IskeyErr, IsJudgeFlg);
                                until TempExcelBuf.Next() <= 0;
                            end;
                            InsertOrModify(TestPurchLine, IsRecModify, IskeyErr, DataCnt, ErrCnt, IsJudgeFlg);
                        end; */
                        TempExcelBuf.CloseBook();
                        if IsErrFlag then begin
                            CreateErroLog();
                        end;
                        ImportMessage(DataCnt, ErrCnt, IsImport);
                    end;
                    CurrPage.Close();
                end;
            }
        }
    }
    var
        PrevPurchLine: record "Purchase Line";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        FileExt: Text;
        ErrDataTxt: Text;
        FileName: Text[250];
        IsErrFlag: Boolean;
        IsImport: Boolean;
        //IsImpTest: Boolean;
        ImpFileLbl: Label 'Import excel file';
        BlankFileErr: Label 'File name can not be blank.';
        DialogTxt: Label 'Excel File (%1)|%1';
        FilterTxt: Label '(.xlsx)|*.xlsx|All Files (*.*)|*.*', Locked = true;

    trigger OnInit()
    begin
        IsImport := true;
        //IsImpTest := false;
    end;

    procedure ValidateExcelData(var pExcelBuf: Record "Excel Buffer"; var pPurchLine: record "Purchase Line";
                               var IsModify: Boolean; var IskeyErr: Boolean; var IsJudgeFlg: Boolean)
    begin
        case pExcelBuf."Column No." of
            1:
                begin
                    if not Evaluate(pPurchLine."Document Type", pExcelBuf."Cell Value as Text") then begin
                        ErrLogWrite(pExcelBuf, pPurchLine.FieldName(pPurchLine."Document Type"));
                        IskeyErr := true;
                        IsErrFlag := true;
                    end;
                end;
            2:
                begin
                    if not Evaluate(pPurchLine."Document No.", pExcelBuf."Cell Value as Text") then begin
                        ErrLogWrite(pExcelBuf, pPurchLine.FieldName(pPurchLine."Document No."));
                        IskeyErr := true;
                        IsErrFlag := true;
                    end;
                end;
            3:
                begin
                    if not Evaluate(pPurchLine."Line No.", pExcelBuf."Cell Value as Text") then begin
                        ErrLogWrite(pExcelBuf, pPurchLine.FieldName(pPurchLine."Line No."));
                        IskeyErr := true;
                        IsErrFlag := true;
                    end;
                end;

            4:
                begin
                    InsertModifyJudge(pPurchLine, IsModify, IsJudgeFlg);
                    if not Evaluate(pPurchLine."Buy-from Vendor No.", pExcelBuf."Cell Value as Text") then begin
                        ErrLogWrite(pExcelBuf, pPurchLine.FieldName(pPurchLine."Buy-from Vendor No."));
                        IskeyErr := true;
                        IsErrFlag := true;
                    end;
                end;
            5:
                begin
                    InsertModifyJudge(pPurchLine, IsModify, IsJudgeFlg);
                    if not Evaluate(pPurchLine."Type", pExcelBuf."Cell Value as Text") then begin
                        ErrLogWrite(pExcelBuf, pPurchLine.FieldName(pPurchLine."Type"));
                        IskeyErr := true;
                        IsErrFlag := true;
                    end else begin
                        pPurchLine.Validate("Type");
                    end;
                end;
            6:
                begin
                    InsertModifyJudge(pPurchLine, IsModify, IsJudgeFlg);
                    if not Evaluate(pPurchLine."No.", pExcelBuf."Cell Value as Text") then begin
                        ErrLogWrite(pExcelBuf, pPurchLine.FieldName(pPurchLine."No."));
                        IskeyErr := true;
                        IsErrFlag := true;
                    end else begin
                        pPurchLine.Validate("No.");
                    end;
                end;
            7:
                begin
                    InsertModifyJudge(pPurchLine, IsModify, IsJudgeFlg);
                    if not Evaluate(pPurchLine."Location Code", pExcelBuf."Cell Value as Text") then begin
                        ErrLogWrite(pExcelBuf, pPurchLine.FieldName(pPurchLine."Location Code"));
                        IskeyErr := true;
                        IsErrFlag := true;
                    end else begin
                        pPurchLine.Validate("Location Code");
                    end;
                end;
            8:
                begin
                    InsertModifyJudge(pPurchLine, IsModify, IsJudgeFlg);
                    if not Evaluate(pPurchLine."Unit of Measure", pExcelBuf."Cell Value as Text") then begin
                        ErrLogWrite(pExcelBuf, pPurchLine.FieldName(pPurchLine."Unit of Measure"));
                        IskeyErr := true;
                        IsErrFlag := true;
                    end;
                end;
            9:
                begin
                    InsertModifyJudge(pPurchLine, IsModify, IsJudgeFlg);
                    if not Evaluate(pPurchLine."Quantity", pExcelBuf."Cell Value as Text") then begin
                        ErrLogWrite(pExcelBuf, pPurchLine.FieldName(pPurchLine."Quantity"));
                        IskeyErr := true;
                        IsErrFlag := true;
                    end else begin
                        pPurchLine.Validate("Quantity");
                    end;
                end;
            10:
                begin
                    InsertModifyJudge(pPurchLine, IsModify, IsJudgeFlg);
                    if not Evaluate(pPurchLine."Direct Unit Cost", pExcelBuf."Cell Value as Text") then begin
                        ErrLogWrite(pExcelBuf, pPurchLine.FieldName(pPurchLine."Direct Unit Cost"));
                        IskeyErr := true;
                        IsErrFlag := true;
                    end else begin
                        pPurchLine.Validate("Direct Unit Cost");
                    end;
                end;
            else
        end;
    end;

    procedure ErrLogWrite(var pExcelBuf: Record "Excel Buffer"; FieldTxt: Text)
    var
        CRLF: text;
        ErrLbl1: label 'Excelシート ';
        ErrLbl2: label ' の値はフィールド ';
        ErrLbl3: label 'に適合しません : ';
    begin
        CRLF[1] := 13;
        CRLF[2] := 10;

        ErrDataTxt += 'E' + Format(pExcelBuf."Column No.") + ','
               + ErrLbl1 + pExcelBuf.xlColID + Format(pExcelBuf."Row No.")
               + ErrLbl2 + FieldTxt
               + ErrLbl3 + pExcelBuf."Cell Value as Text"
               + CRLF;
    end;

    procedure CreateErroLog()
    var
        ErrTempBlob: Codeunit "Temp Blob";
        ErrFileMgt: Codeunit "File Management";
        ErrInstream: InStream;
        Outstream1: OutStream;
        DateFormatLbl: label '<Year4><Month,2><Day,2><Hours24><Minutes,2><Seconds,2><Second dec>', Locked = true;
        DialogTitleLbl: Label 'Download Error Log', Locked = true;
        FileFilterLbl: Label 'Text Files (*.txt)|*.txt', Locked = true;
        FileExtLbl: Label '_Err.csv', Locked = true;
    begin
        FileName := Format(CurrentDateTime, 0, DateFormatLbl) + FileExtLbl;
        ErrTempBlob.CreateOutStream(Outstream1);
        Outstream1.WriteText(ErrDataTxt);

        ErrTempBlob.CreateInStream(ErrInstream);
        ErrFileMgt.DownloadFromStreamHandler(ErrInstream, DialogTitleLbl, '', FileFilterLbl, FileName);
    end;

    procedure InsertOrModify(var pPurchLine: record "Purchase Line"; var pIsRecModify: Boolean; var IskeyErr: Boolean;
                             var DataCnt: Integer; var ErrCnt: Integer; var IsJudgeFlg: Boolean)
    var
        PurchOrderMgt: Codeunit PurchOrderMgmt;
    begin
        if not IskeyErr then begin
            if pIsRecModify then begin
                if pPurchLine.Modify() then
                    PurchOrderMgt.PurchLineLotModify(pPurchLine, PrevPurchLine);
            end else begin
                if pPurchLine.Insert() then
                    PurchOrderMgt.PurchLineLotInsert(pPurchLine);
            end;
            DataCnt += 1;
        end else begin
            ErrCnt += 1;
        end;
        pPurchLine.Reset();
        InitPurchLine(pPurchLine);
        InitPurchLine(PrevPurchLine);
        IskeyErr := false;
        IsJudgeFlg := false;
    end;

    procedure ImportMessage(var DataCnt: Integer; var ErrCnt: Integer; IsImport: Boolean)
    var
        CRLF: Text;
        TAB: Text;
        MsgTitle: Text;
        MsgLbl0: label 'インポートテストが終了しました。', Locked = true;
        MsgLbl1: label 'ファイル名.........', Locked = true;
        MsgLbl2: label 'データ件数.........', Locked = true;
        MsgLbl3: label 'インポート件数.....', Locked = true;
        MsgLbl5: label 'エラー件数.........', Locked = true;
        MsgLbl6: label 'インポートが終了しました。', Locked = true;
    begin

        CRLF[1] := 13;
        CRLF[2] := 10;
        TAB[1] := 9;
        if IsImport then begin
            MsgTitle := MsgLbl6;
        end else begin
            MsgTitle := MsgLbl0;
        end;
        Message(MsgTitle + CRLF
        + MsgLbl1 + ConvertStr(FileName, '\', '/') + CRLF
        + MsgLbl2 + TAB + format(DataCnt) + CRLF
        + MsgLbl3 + TAB + format(DataCnt) + CRLF
        + MsgLbl5 + TAB + format(ErrCnt) + CRLF);
    end;

    procedure ClearVariable(var DataCnt: Integer; var ErrCnt: Integer; var IsRecModify: Boolean; var IskeyErr: Boolean; var IsJudgeFlg: Boolean)
    var
    begin
        DataCnt := 0;
        ErrCnt := 0;
        IsRecModify := true;
        IskeyErr := false;
        IsJudgeFlg := false;
        IsErrFlag := false;
        ErrDataTxt := '';
    end;

    procedure SetPurchLineFilter(var pPurchLine: record "Purchase Line")
    var
    begin
        pPurchLine.SetRange("Document Type", pPurchLine."Document Type");
        pPurchLine.SetRange("Document No.", pPurchLine."Document No.");
        pPurchLine.SetRange("Line No.", pPurchLine."Line No.");
    end;

    procedure InitPurchLine(var pPurchLine: record "Purchase Line")
    var
        TempPurchaseLine: record "Purchase Line" temporary;
    begin
        TempPurchaseLine.Reset();
        pPurchLine."Document Type" := TempPurchaseLine."Document Type";
        pPurchLine."Document No." := TempPurchaseLine."Document No.";
        pPurchLine."Line No." := TempPurchaseLine."Line No.";
        pPurchLine."Buy-from Vendor No." := TempPurchaseLine."Buy-from Vendor No.";
        pPurchLine."Type" := TempPurchaseLine."Type";
        pPurchLine."No." := TempPurchaseLine."No.";
        pPurchLine."Location Code" := TempPurchaseLine."Location Code";
        pPurchLine."Unit of Measure" := TempPurchaseLine."Unit of Measure";
        pPurchLine."Quantity" := TempPurchaseLine."Quantity";
        pPurchLine."Direct Unit Cost" := TempPurchaseLine."Direct Unit Cost";
    end;

    procedure InsertModifyJudge(var pPurchLine: record "Purchase Line"; var IsRecModify: Boolean; var pJudgeFlg: Boolean)
    var
    begin
        if not pJudgeFlg then begin
            SetPurchLineFilter(pPurchLine);
            if not pPurchLine.FindFirst() then begin
                IsRecModify := false;
            end else Begin
                PrevPurchLine := pPurchLine;
                IsRecModify := true;
            end;
            pJudgeFlg := true;
        end;
    end;
}

