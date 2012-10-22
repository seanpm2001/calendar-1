//------------------------------------------------------------------------------
// <autogenerated>
//     This Oxygene source code was generated by a tool.
//     Oxygene Version: 5.0.30.954
//     Runtime Version: 4.0.30319.239
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------

{$HIDE H7}
{$HIDE W1}
{$HIDE W27}
{$HIDE H11}

namespace RemObjects.Calendar;

interface

uses
  System,
  RemObjects.SDK,
  RemObjects.SDK.Types,
  RemObjects.SDK.Server,
  RemObjects.SDK.Server.ClassFactories,
  RemObjects.DataAbstract.Server;
  
type
  [RemObjects.SDK.Server.ClassFactories.StandardClassFactory]
  [RemObjects.SDK.Server.Service(Name := 'DataService', InvokerClass := typeOf(DataService_Invoker), ActivatorClass := typeOf(DataService_Activator))]
  DataService = public class(RemObjects.DataAbstract.Server.DataAbstractService, IDataService)
  private 
    method InitializeComponent;
    method DataService_AfterSqlGeneration(sender: RemObjects.DataAbstract.Server.BusinessProcessor; e: RemObjects.DataAbstract.Server.SqlGenerationEventArgs);
    var components: System.ComponentModel.Container := nil;
  protected 
    method Dispose(aDisposing: System.Boolean); override;
  public 
    constructor;
  end;
  
implementation

{ DataService }

constructor DataService;
begin
  inherited constructor();
  self.InitializeComponent();
end;

method DataService.InitializeComponent;
begin
  // 
  // DataService
  // 
  self.AcquireConnection := true;
  self.ConnectionName := 'Connection';
  self.ServiceSchemaName := 'Calendar.daSchema';
  self.AfterSqlGeneration += new RemObjects.DataAbstract.Server.SqlGenerationEventHandler(@self.DataService_AfterSqlGeneration);
end;

method DataService.Dispose(aDisposing: System.Boolean);
begin
  if aDisposing then begin
    if (self.components <> nil) then begin
      self.components.Dispose();
    end;
  end;
  inherited Dispose(aDisposing);
end;

method DataService.DataService_AfterSqlGeneration(sender: RemObjects.DataAbstract.Server.BusinessProcessor; e: RemObjects.DataAbstract.Server.SqlGenerationEventArgs);
begin
  ConsoleApp.Logger.Debug('SQL: '+e.SQLStatement);
end;



end.
