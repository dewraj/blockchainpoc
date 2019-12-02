pragma solidity >=0.4.25 <0.6.0;

contract TradeBlockChainV6
{
    enum StateType { Active, Modify, PendingCustomReview, Terminated, Completed }
    StateType public State;
    uint public TotalValue;
    string public CountryOfOrigin;
    uint public Tax;
    uint public CustomDuty;
    string public ProductCode;
    uint public OrderQuanity;

    address public InstanceOwner;
    address public GTS;
    address public Broker;
 
    constructor(string memory productcode, uint256 quantity) public
    {

        InstanceOwner = msg.sender;
        OrderQuanity = quantity;
        ProductCode = productcode;
        State = StateType.Active;
    }

    function Active() public
    {
        InstanceOwner = msg.sender;
    }

    function PendingCustomReview() public
    {
        State = StateType.PendingCustomReview;
        InstanceOwner = msg.sender;
    }

    function Terminate() public
    {
        State = StateType.Terminated;
        InstanceOwner = 0x0000000000000000000000000000000000000000;
    }

    function Modify(uint256 quantity, uint256 totalvalue, uint256 tax) public
    {
        InstanceOwner = msg.sender;
        OrderQuanity = quantity;
        TotalValue = totalvalue;
        Tax = tax;
        State = StateType.Modify;
    }
    function UpdateTax(uint256 tax) public
    {
        InstanceOwner = msg.sender;
        Tax = tax;
        State = StateType.Completed;
    }
}