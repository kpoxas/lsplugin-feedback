{include file='header.tpl' noSidebar=true}

<h2 class="page-header"><a href="{router page='feedback'}">{$aLang.plugin.feedback.feedback}</a> <span>&raquo;</span> {$aLang.plugin.feedback.acp_filter}</h2>

{include file="$sTemplatePathPlugin/menu.feedback.admin.tpl"}

<div class="wrapper-content wrapper-content-dark">
	<form action="{router page='feedback'}admin/filter" method="POST" enctype="multipart/form-data">
		<h3>
			<label for="filter_type">{$aLang.plugin.feedback.acp_ip_add} <select id="filter_type" name="filter_type" class="input-text input-width-200">
				<option value="white"{if $_aRequest.filter_type == 'white'} selected{/if}>{$aLang.plugin.feedback.acp_white_list}</option>
				<option value="black"{if $_aRequest.filter_type == 'black'} selected{/if}>{$aLang.plugin.feedback.acp_black_list}</option>
			</select></label>
		</h3>

		<div class="clearfix">
			<div class="ip-block">
				<label for="filter_ip1_1">IP from:</label>
				<input type="text" id="filter_ip1_1" name="filter_ip[1][1]" value="{$_aRequest.filter_ip[1][1]}" size="30" maxlength="3" class="input-text input-feedback-ip js-cp" /> .
				<input type="text" id="filter_ip1_2" name="filter_ip[1][2]" value="{$_aRequest.filter_ip[1][2]}" size="30" maxlength="3" class="input-text input-feedback-ip js-cp" /> .
				<input type="text" id="filter_ip1_3" name="filter_ip[1][3]" value="{$_aRequest.filter_ip[1][3]}" size="30" maxlength="3" class="input-text input-feedback-ip js-cp" /> .
				<input type="text" id="filter_ip1_4" name="filter_ip[1][4]" value="{$_aRequest.filter_ip[1][4]}" size="30" maxlength="3" class="input-text input-feedback-ip js-cp" />
			</div>
			<div class="ip-block">
				<label for="filter_ip2_1">IP to: <input type="checkbox" class="input-checkbox" value="1" onchange="ls.feedback.admin.copyWriterEnabler(this.checked)"></input></label>
				<input type="text" id="filter_ip2_1" name="filter_ip[2][1]" value="{$_aRequest.filter_ip[2][1]}" size="30" maxlength="3" class="input-text input-feedback-ip" /> .
				<input type="text" id="filter_ip2_2" name="filter_ip[2][2]" value="{$_aRequest.filter_ip[2][2]}" size="30" maxlength="3" class="input-text input-feedback-ip" /> .
				<input type="text" id="filter_ip2_3" name="filter_ip[2][3]" value="{$_aRequest.filter_ip[2][3]}" size="30" maxlength="3" class="input-text input-feedback-ip" /> .
				<input type="text" id="filter_ip2_4" name="filter_ip[2][4]" value="{$_aRequest.filter_ip[2][4]}" size="30" maxlength="3" class="input-text input-feedback-ip" />
			</div>
		</div>
		<p>
			<label for="filter_comment">{$aLang.plugin.feedback.acp_black_list_comment}</label>
			<input type="text" id="filter_comment" name="filter_comment" value="" class="input-text">
		</p>
		<button type="submit" class="button" name="filter_ip_submit" onclick="return ls.feedback.admin.submitIpForm()"> + Add</button>
	</form>
</div>

<div class="wrapper-content fl-l" style="width:45%">
	<h3>{$aLang.plugin.feedback.acp_black_list}</h3>

	<ul class="iplist" id="ip_black_list">
		{foreach from=$aBlackList item=oBlack}
			<li id="ip_{$oBlack->getId()}">
				<div class="iplist_actions">
					<a href="javascript:ls.feedback.admin.deleteIp('{$oBlack->getHash()}')" title="" class="icon-remove"></a>
				</div>
				<span class="iplist_ip">{$oBlack->getFromLong()|escape:"html"}</span> -
				<span class="iplist_ip">{$oBlack->getToLong()|escape:"html"}</span>
				{if $oBlack->getComment()}
				<div class="iplist_comment">{$oBlack->getComment()|escape:"html"}</div>
				{/if}
			</li>
		{/foreach}
	</ul>
</div>

<div class="wrapper-content fl-l" style="width:45%">
	<h3>{$aLang.plugin.feedback.acp_white_list}</h3>

	<ul class="iplist" id="ip_white_list">
		{foreach from=$aWhiteList item=oWhite}
			<li id="ip_{$oWhite->getId()}">
				<div class="iplist_actions">
					<a href="javascript:ls.feedback.admin.deleteIp('{$oWhite->getHash()}')" title="{$aLang.plugin.feedback.acp_ip_del}" class="icon-remove"></a>
				</div>
				<strong class="iplist_ip">{$oWhite->getFromLong()|escape:"html"}</strong> -
				<strong class="iplist_ip">{$oWhite->getToLong()|escape:"html"}</strong>
				{if $oWhite->getComment()}
				<div class="iplist_comment">{$oWhite->getComment()|escape:"html"}</div>
				{/if}
			</li>
		{/foreach}
	</ul>
</div>

{include file='footer.tpl'}