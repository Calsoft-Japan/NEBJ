codeunit 50004 NEBJReportManagement
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure NEBJOnAfterSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        case ReportId of
            // Report ID 4 => 50003
            Report::"Detail Trial Balance":
                NewReportId := Report::"NEBJ Detail Trial Balance";
        end;
    end;
}