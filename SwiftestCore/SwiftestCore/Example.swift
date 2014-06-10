class Example {
    
    var description : String
    var blk : ExampleBlock?
    var status = ExampleStatus.Pending
    
    init(desc: String, blk: ExampleBlock?) {
        self.description = desc
        self.blk  = blk
    }
}