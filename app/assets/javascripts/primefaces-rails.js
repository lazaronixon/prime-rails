/**
 * PrimeFaces InputText Widget
 */
PrimeFaces.widget.InputText = PrimeFaces.widget.BaseWidget.extend({
    
    init: function(cfg) {
        this._super(cfg);         
        this.jq.puiinputtext();
    }
});

/**
 * PrimeFaces InputText Widget
 */
PrimeFaces.widget.InputTextarea = PrimeFaces.widget.BaseWidget.extend({
    
    init: function(cfg) {
        this._super(cfg);  
        if (this.cfg.counter) {
          this.cfg.counter = $(PrimeFaces.escapeClientId(this.cfg.counter))
        }      
        this.jq.puiinputtextarea(this.cfg);
    }
});

/**
 * PrimeFaces TabView Widget
 */
PrimeFaces.widget.TabView = PrimeFaces.widget.BaseWidget.extend({
    
    init: function(cfg) {
        this._super(cfg);           
        this.jq.puitabview(cfg);
    }
});


/**
 * PrimeFaces Button Widget
 */
PrimeFaces.widget.Button = PrimeFaces.widget.BaseWidget.extend({
    
    init: function(cfg) {
        this._super(cfg);           
        this.jq.puibutton(cfg);
    }
});

/**
 * PrimeFaces Button Widget
 */
PrimeFaces.widget.Dialog = PrimeFaces.widget.BaseWidget.extend({
    
    init: function(cfg) {
        this._super(cfg);           
        this.jq.puidialog(cfg);
    }
});

/**
 * PrimeFaces Checkbox Widget
 */
PrimeFaces.widget.CheckBox = PrimeFaces.widget.BaseWidget.extend({
    
    init: function(cfg) {
        this._super(cfg);           
        this.jq.puicheckbox(cfg);
    }
});

/**
 * PrimeFaces Fieldset Widget
 */
PrimeFaces.widget.Fieldset = PrimeFaces.widget.BaseWidget.extend({
    
    init: function(cfg) {
        this._super(cfg);           
        this.jq.puifieldset(cfg);
    }
});