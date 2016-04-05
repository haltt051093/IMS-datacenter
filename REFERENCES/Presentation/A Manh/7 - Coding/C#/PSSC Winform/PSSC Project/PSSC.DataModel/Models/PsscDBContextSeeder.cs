using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using PSSC.XCommon;
using PSSC.DataModel;

namespace PSSC.DataModel.Models
{
    public class PsscDBContextSeeder:DropCreateDatabaseIfModelChanges<PsscDBContext>
    {
        protected override void Seed(PsscDBContext psscDBContext)
        {
            //Tao loai marble va repository thu 1 - Red
            Marble redMarble = new Marble()
            {
                MarbleColor = Convert.ToString(MarbleColor.Red),
                MarbleDescription = "Red Marble",
                Price = 100,
                DateOfCreation = DateTime.Now,
                DateOfLastModification = DateTime.Now,
                Repositoies = new List<Repository>()
                {
                    new Repository()
                    {
                        RepositoryName = "Red Repository",
                        RespositoyDesciption ="This repository contains red marbles",
                        Quantity = 0,
                        QuantityLimits = 8,
                        DateOfCreation = DateTime.Now,
                        DateOfLastModification = DateTime.Now
                    }
                }
            };
            psscDBContext.Marbles.Add(redMarble);

            //Tao loai marble va repository thu 2 - Green
            Marble greenMarble = new Marble()
            {
                MarbleColor = Convert.ToString(MarbleColor.Green),
                MarbleDescription = "Include green light or dark Marble",
                Price = 200,
                DateOfCreation = DateTime.Now,
                DateOfLastModification = DateTime.Now,
                Repositoies = new List<Repository>()
                {
                    new Repository()
                    {
                        RepositoryName = "Green Repository",
                        RespositoyDesciption = "This repository contains green marbles",
                        Quantity = 0,
                        QuantityLimits = 8,
                        DateOfCreation = DateTime.Now,
                        DateOfLastModification = DateTime.Now
                    }
                }
            };
            psscDBContext.Marbles.Add(greenMarble);

            //Tao loai marble va repository thu 3 - Blue
            Marble blueMarble = new Marble()
            {
                MarbleColor = Convert.ToString(MarbleColor.Blue),
                MarbleDescription = "Include blue light or dark Marble",
                Price = 300,
                DateOfCreation = DateTime.Now,
                DateOfLastModification = DateTime.Now,
                Repositoies = new List<Repository>()
                {
                    new Repository()
                    {
                        RepositoryName = "Blue Repository",
                        RespositoyDesciption = "This repository contains blue marbles",
                        Quantity = 0,
                        QuantityLimits = 8,
                        DateOfCreation = DateTime.Now,
                        DateOfLastModification = DateTime.Now
                    }
                }
            };
            psscDBContext.Marbles.Add(blueMarble);

            //Tao loai marble va repository thu 4
            Marble purpleMarble = new Marble()
            {
                MarbleColor = Convert.ToString(MarbleColor.Purple),
                MarbleDescription = "Include purple light or dark Marble",
                Price = 400,
                DateOfCreation = DateTime.Now,
                DateOfLastModification = DateTime.Now,
                Repositoies = new List<Repository>()
                {
                    new Repository()
                    {
                        RepositoryName = "Purple Repository",
                        RespositoyDesciption = "This repository contains purpke marbles",
                        Quantity = 0,
                        QuantityLimits = 8,
                        DateOfCreation = DateTime.Now,
                        DateOfLastModification = DateTime.Now
                    }
                }
            };
            psscDBContext.Marbles.Add(purpleMarble);

            //Tao loai marble va repository thu 5
            Marble pinkMarble = new Marble()
            {
                MarbleColor = Convert.ToString(MarbleColor.Pink),
                MarbleDescription = "Include pink light or dark Marble",
                Price = 500,
                DateOfCreation = DateTime.Now,
                DateOfLastModification = DateTime.Now,
                Repositoies = new List<Repository>()
                {
                    new Repository()
                    {
                        RepositoryName = "Pink Repository",
                        RespositoyDesciption = "This repository contains pink marbles",
                        Quantity = 0,
                        QuantityLimits = 8,
                        DateOfCreation = DateTime.Now,
                        DateOfLastModification = DateTime.Now
                    }
                }
            };
            psscDBContext.Marbles.Add(pinkMarble);

            //Tao Status cua InputLog
            //Quy uoc ky hieu cuar StatusName [Ma Status]x[Ma so thu tu]
            //Ma Status gom co S (success), W(warning) ,E(Error), F(Failed), I(Information)
            //Ma so thu tu - hai chu so, tang dan

            InputLogStatusCode status1 = new InputLogStatusCode()
            {
                StatusName = "Sx01",
                StatusDescription = "Marble is inputted successfully",
                StatusType = Convert.ToString(StatusType.Success),
                DateOfCreation = DateTime.Now,
                DateOfLastModification = DateTime.Now
            };
            psscDBContext.InputLogStatusCodes.Add(status1);

            InputLogStatusCode status2 = new InputLogStatusCode()
            {
                StatusName = "Wx01",
                StatusDescription = "Repositories don't have enough space",
                StatusType = Convert.ToString(StatusType.Warning),
                DateOfCreation = DateTime.Now,
                DateOfLastModification = DateTime.Now
            };
            psscDBContext.InputLogStatusCodes.Add(status2);

            InputLogStatusCode status3 = new InputLogStatusCode()
            {
                StatusName = "Fx01",
                StatusDescription = "Can't not detect color of marble.",
                StatusType = Convert.ToString(StatusType.Failed),
                DateOfCreation = DateTime.Now,
                DateOfLastModification = DateTime.Now
            };
            psscDBContext.InputLogStatusCodes.Add(status3);

            //Tao hai port input va output
            PortSetting inputPortSetting = new PortSetting()
            {
                Name = "InputPort",
                Value = ""
            };
            psscDBContext.PortSettings.Add(inputPortSetting);

            PortSetting outputPortSetting = new PortSetting()
            {
                Name = "OutputPort",
                Value = ""
            };
            psscDBContext.PortSettings.Add(outputPortSetting);

            base.Seed(psscDBContext);
        }
    }
}
