String.prototype.format = function(args) {
    var newStr = this;
    for (var key in args) {
        newStr = newStr.replace(new RegExp('{' + key + '}', "g"), args[key]);
    }
    return newStr;
}

/**
 * PrimeFaces InputText Widget
 */
PrimeFaces.widget.InputText = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        if (cfg.spinner) {
            this.jq.puispinner(cfg);
        } else if (cfg.rating){
            this.jq.puirating(cfg);
        } else {
            this.jq.puiinputtext(cfg);
        }
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
    },

    show: function() { 
        this.jq.puidialog('show');   
    },
            
    hide: function() { 
        this.jq.puidialog('hide');   
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

/**
 * PrimeFaces Breadcrumb Widget
 */
PrimeFaces.widget.Breadcrumb = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puibreadcrumb(cfg);
    }
});

/**
 * PrimeFaces Panel Widget
 */
PrimeFaces.widget.Panel = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puipanel(cfg);
    }
});

/**
 * PrimeFaces Password Widget
 */
PrimeFaces.widget.Password = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puipassword(cfg);
    }
});

/**
 * PrimeFaces Progressbar Widget
 */
PrimeFaces.widget.Progressbar = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puiprogressbar(cfg);
    }
});


/**
 * PrimeFaces Tooltip Widget
 */
PrimeFaces.widget.Tooltip = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);

        if (cfg.global) {
            $(document).puitooltip(cfg);
        } else {
            forId = PrimeFaces.escapeClientId(cfg.for);
            $(forId).puitooltip(cfg);
        }
    }
});

/**
 * PrimeFaces Dropdown Widget
 */
PrimeFaces.widget.Dropdown = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        if (cfg.content) {
            contentFunc = cfg.content;
            cfg.content = function(opt) { return contentFunc.format({ option: opt });};            
        }
        
        if (cfg.change) {
            contentChange = cfg.change;
            cfg.change = function(e) { eval(contentChange); };           
        }       
                             
        if (cfg.listbox) {
            this.jq.puilistbox(cfg);                   
        } else {
            this.jq.puidropdown(cfg);

            if (cfg.selectValue) {
                this.jq.puidropdown('selectValue', cfg.selectValue)
            }
        }
    }
});


/**
 * PrimeFaces Accordion Widget
 */
PrimeFaces.widget.Accordion = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puiaccordion(cfg);
    }
});


/**
 * PrimeFaces Accordion Widget
 */
PrimeFaces.widget.RadioButton = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.find(':radio').puiradiobutton(cfg);
    }
});

/**
 * PrimeFaces Growl Widget
 */
PrimeFaces.widget.Growl = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        var _self = this;

        this.jq.puigrowl(cfg);

        addMessage = function(msg) {
            _self.jq.puigrowl('show', msg)
        }

        if (cfg.messages) {
            addMessage(cfg.messages);
        }
    }
});

/**
 * PrimeFaces Menu Widget
 */
PrimeFaces.widget.Menu = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);

        if (this.cfg.trigger) {
            this.cfg.trigger = $(PrimeFaces.escapeClientId(this.cfg.trigger))
        }

        this.jq.puimenu(cfg);
    }
});

/**
 * PrimeFaces Menubar Widget
 */
PrimeFaces.widget.Menubar = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);

        this.jq.puimenubar(cfg);
    }
});

/**
 * PrimeFaces ContextMenu Widget
 */
PrimeFaces.widget.ContextMenu = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);

        if (this.cfg.target) {
            this.cfg.target = $(PrimeFaces.escapeClientId(this.cfg.target))
        }

        this.jq.puicontextmenu(cfg);
    }
});

/**
 * PrimeFaces SlideMenu Widget
 */
PrimeFaces.widget.SlideMenu = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);        

        if (this.cfg.trigger) {
            this.cfg.trigger = $(PrimeFaces.escapeClientId(this.cfg.trigger))
        }

        this.jq.puislidemenu(cfg);
    }
});


/**
 * PrimeFaces TieredMenu Widget
 */
PrimeFaces.widget.TieredMenu = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);        

        if (this.cfg.trigger) {
            this.cfg.trigger = $(PrimeFaces.escapeClientId(this.cfg.trigger))
        }

        this.jq.puitieredmenu(cfg);
    }
});

/**
 * PrimeFaces Lightbox Widget
 */
PrimeFaces.widget.Lightbox = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puilightbox(cfg);
    }
});

/**
 * PrimeFaces Galleria Widget
 */
PrimeFaces.widget.Galleria = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puigalleria(cfg);
    }
});

/**
 * PrimeFaces Notify Widget
 */
PrimeFaces.widget.Notify = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puinotify(cfg);                        
    },
    
    show: function() { 
        this.jq.puinotify('show',this.jq.html());   
    },
            
    hide: function() { 
        this.jq.puinotify('hide');   
    }            
});

/**
 * PrimeFaces Picklist Widget
 */
PrimeFaces.widget.Picklist = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puipicklist(cfg);                        
    }
});

/**
 * PrimeFaces Autocomplete Widget
 */
PrimeFaces.widget.Autocomplete = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        
        if (cfg.content) {
            contentFunc = cfg.content;
            cfg.content = function(data) { return contentFunc.format({ 'option.label': data.label },{ 'option.value': data.value } );};            
        } 
        
        if (cfg.url) {
            form = this.jq.parents('form:first');
            cfg.completeSource = function(request, response) {
                $.ajax({
                    type: "POST",
                    url: cfg.url,
                    data: form.serializeArray(),
                    dataType: "json",
                    context: this,
                    success: function(data) {
                        response.call(this, data);
                    }
                });
            };
        }
        
        this.jq.puiautocomplete(cfg);                        
    }
});

/**
 * PrimeFaces SplitButton Widget
 */
PrimeFaces.widget.SplitButton = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puisplitbutton(cfg);                        
    }
});


/**
 * PrimeFaces Paginator Widget
 */
PrimeFaces.widget.Paginator = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.inputPage = $(this.jqId + '_page');  
        this.form = this.jq.parents('form:first');                 
        var _self = this;              
        
        cfg.paginate = function(event,state){
            _self.inputPage.val(state.page +1);
            _self.form.submit();
        };                    
        
        this.jq.puipaginator(cfg);
                                        
    }
});

/**
 * PrimeFaces SplitButton Widget
 */
PrimeFaces.widget.DataTable = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.selectionHolder = $(this.jqId + '_selection'); 
        this.selection = []
        var _self = this;                                                      
                    
        cfg.rowSelect = function(event, data) { 
            _self.selection = [];
            _self.addSelection(data[cfg.rowkey]);
            _self.writeSelections();
        },        
                
        cfg.rowUnselect = function(event, data) {
            _self.removeSelection(data[cfg.rowkey]);
            _self.writeSelections();
        },                
        
        this.jq.puidatatable(cfg); 

        
          
    },
            
    /**
     * Writes selected row ids to state holder
     */
    writeSelections: function() {
        $(this.selectionHolder).val(this.selection.join(','));
    },      
            
    /**
     * Remove given rowIndex from selection
     */
    removeSelection: function(rowIndex) {        
        this.selection = $.grep(this.selection, function(value) {
            return value != rowIndex;
        });
    },
    
    /**
     * Adds given rowIndex to selection if it doesn't exist already
     */
    addSelection: function(rowIndex) {        
            this.selection.push(rowIndex);        
    },
    
    isSingleSelection: function() {
        return this.cfg.selectionMode == 'single';
    },
    
    isMultipleSelection: function() {
        return this.cfg.selectionMode == 'multiple';
    }    
});