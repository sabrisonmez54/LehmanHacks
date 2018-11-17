using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace test
{

    public partial class Default : System.Web.UI.Page
    {
        List<string> ADA;
        List<string> equipmenttype;
        List<string> reasons;
        List<string> boroughs;
        List<Outage> outages;
        List<string> outagedate;
        List<string> estimatedreturntoservice;

        protected void Page_Load(object sender, EventArgs e){

            if(!IsPostBack){
                divDetails.Visible = false;
                lblStation.Visible = false;
                XmlDocument elevatorurl = new XmlDocument();
                elevatorurl.Load("http://web.mta.info/developers/data/nyct/nyct_ene.xml");
                XmlElement root = elevatorurl.DocumentElement;
                XmlNodeList nodes = root.SelectNodes("/NYCOutages/outage");
                foreach (XmlNode xn in nodes)
                {
                    //Response.Write(xn["station"].InnerText + " ");
                    var xc = ddlStations.Items.FindByText(xn["station"].InnerText);

                    ddlStations.Items.Add(xn["station"].InnerText + " " + xn["trainno"].InnerText);



                }
                ddlStations.Visible = true;
            }
        }

        public void b1_Click(object sender, EventArgs args)
        {
            string text = ddlStations.SelectedValue;
            XmlDocument elevatorurl = new XmlDocument();
            elevatorurl.Load("http://web.mta.info/developers/data/nyct/nyct_ene.xml");
            XmlElement root = elevatorurl.DocumentElement;
            XmlNodeList nodes = root.SelectNodes("/NYCOutages/outage");
            equipmenttype = new List<string>();
            reasons = new List<string>();
            boroughs = new List<string>();
            outagedate = new List<string>();
            estimatedreturntoservice = new List<string>();
            ADA = new List<string>();

            foreach (XmlNode xn in nodes)
            {
                //Response.Write(xn["station"].InnerText + " ");
                boroughs.Add(xn["borough"].InnerText);
                reasons.Add(xn["reason"].InnerText);
                outagedate.Add(xn["outagedate"].InnerText);
                estimatedreturntoservice.Add(xn["estimatedreturntoservice"].InnerText);
                equipmenttype.Add(xn["equipmenttype"].InnerText);
                ADA.Add(xn["ADA"].InnerText);
            }



           /* XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(Server.MapPath("nyct_ene.xml"));

            equipmenttype = new List<string>();
            reasons = new List<string>();
            boroughs = new List<string>();
            outages = new List<Outage>();
            outagedate = new List<string>();
            estimatedreturntoservice = new List<string>();
            var uname = xmldoc.GetElementsByTagName("borough");
            foreach (XmlNode usernode in uname)
            {

                boroughs.Add(usernode.InnerText);
            }

            uname = xmldoc.GetElementsByTagName("outagedate");
            foreach (XmlNode usernode in uname)
            {

                outagedate.Add(usernode.InnerText);
            }

            uname = xmldoc.GetElementsByTagName("estimatedreturntoservice");
            foreach (XmlNode usernode in uname)
            {

                estimatedreturntoservice.Add(usernode.InnerText);

            }
            //add all info u need below

            uname = xmldoc.GetElementsByTagName("reason");
            foreach (XmlNode usernode in uname)
            {
                reasons.Add(usernode.InnerText);

            }

            uname = xmldoc.GetElementsByTagName("equipmenttype");
            foreach (XmlNode usernode in uname)
            {

                equipmenttype.Add(usernode.InnerText);

            }*/


            //do this last. this sets all labels 
            int index = ddlStations.SelectedIndex;
            switch (boroughs[index]){
                case "QNS":
                    lblBorough.Text = "Queens";
                    break;
                case "BKN":
                    lblBorough.Text = "Brooklyn";
                    break;
                case "BX":
                    lblBorough.Text = "Bronx";
                    break;
                case "MN":
                    lblBorough.Text = "Manhattan";
                    break;
                default: lblBorough.Text = "Manhattan";
                    break;
            }
            lbloutagedate.Text = outagedate[index];
            lblestimatedreturntoservice.Text = estimatedreturntoservice[index];
            lblreasons.Text = reasons[index];
            lblequipment.Text = equipmenttype[index] == "EL" ? "Elevator" : equipmenttype[index] == "ES" ? "Escalator" : "Power Walk";
            lblADA.Text = ADA[index];
            lblADA.Text = ADA[index] == "Y" ? "Yes" : "No";
            divDetails.Visible = true;
            lblStation.Text = text;
            lblStation.Font.Size = FontUnit.XXLarge;

            lblStation.Visible = true;

        }

        public void b2_Click(object sender, EventArgs args)
        {




        }




    }
}
