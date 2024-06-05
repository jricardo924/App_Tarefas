unit RequestFactory;

interface

uses
  RESTRequest4D;

type
  TRequestFactory = class
  public
    class function CreateRequest(const URL: string): IRequest;
  end;

implementation

class function TRequestFactory.CreateRequest(const URL: string): IRequest;
begin
  Result := TRequest.New.BaseURL(URL)
                    .AddHeader('HeaderName', 'HeaderValue')
                    .BasicAuthentication('api', '123456')
                    .Accept('application/json');
end;

end.

